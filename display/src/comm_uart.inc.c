/* types */

typedef enum {
    RX_IDLE,
    RX_RECEIVE_HEADER,
    RX_RECEIVE_PAYLOAD,
    RX_RECEIVE_CHECKSUM,
    RX_DUMP
} uart_rx_state_t;

typedef enum {
    TX_IDLE,
    TX_SEND_HEADER,
    TX_SEND_PAYLOAD,
    TX_SEND_CHECKSUM
} uart_tx_state_t;

/* data */

static uart_rx_state_t uart_rx_state VAR_RAM = RX_IDLE;
static uart_tx_state_t uart_tx_state VAR_RAM = TX_IDLE;
static struct comm_port_t uart VAR_RAM = {
    .state = {
        .curr_header = {
            .payload_length = 0,
            .sender = MSG_ADDRESS_LPC1114,
            .recipient = MSG_ADDRESS_LPC1114
        },
        .recv_dest = 0,
        .recv_end = 0,
        .trns_src = 0,
        .trns_end = 0,
        .remaining = 0,
        .dest_msg = NULL
    },
    .queue = {
        {
            .empty = true
        },
        {
            .empty = true
        }
    },
    .route_buffer = {
        .in_use = false
    },
    .active_queue = 0
};

static inline void uart_init(const uint32_t baudrate)
{
    NVIC_DisableIRQ(UART_IRQn);

    /* Set 1.6 UART RXD */
    IOCON_PIO1_6 &= ~IOCON_PIO1_6_FUNC_MASK;
    IOCON_PIO1_6 |= IOCON_PIO1_6_FUNC_UART_RXD;

    /* Set 1.7 UART TXD */
    IOCON_PIO1_7 &= ~IOCON_PIO1_7_FUNC_MASK;
    IOCON_PIO1_7 |= IOCON_PIO1_7_FUNC_UART_TXD;

    /* Enable UART clock */
    SCB_SYSAHBCLKCTRL |= (SCB_SYSAHBCLKCTRL_UART);
    SCB_UARTCLKDIV = SCB_UARTCLKDIV_DIV1;     /* divided by 1 */

    /* 8 bits, no Parity, 1 Stop bit */
    UART_U0LCR = (UART_U0LCR_Word_Length_Select_8Chars |
                  UART_U0LCR_Stop_Bit_Select_1Bits |
                  UART_U0LCR_Parity_Disabled |
                  UART_U0LCR_Parity_Select_OddParity |
                  UART_U0LCR_Break_Control_Disabled |
                  UART_U0LCR_Divisor_Latch_Access_Enabled);

    /* Baud rate */
    uint32_t reg_val = SCB_UARTCLKDIV;
    uint32_t fDiv = (((CFG_CPU_CCLK * SCB_SYSAHBCLKDIV)/reg_val)/16)/baudrate;

    UART_U0DLM = fDiv / 256;
    UART_U0DLL = fDiv % 256;

    /* Set DLAB back to 0 */
    UART_U0LCR = (UART_U0LCR_Word_Length_Select_8Chars |
                UART_U0LCR_Stop_Bit_Select_1Bits |
                UART_U0LCR_Parity_Disabled |
                UART_U0LCR_Parity_Select_OddParity |
                UART_U0LCR_Break_Control_Disabled |
                UART_U0LCR_Divisor_Latch_Access_Disabled);

    /* Enable and reset TX and RX FIFO. */
    UART_U0FCR = (UART_U0FCR_FIFO_Enabled |
                  UART_U0FCR_Rx_FIFO_Reset |
                  UART_U0FCR_Tx_FIFO_Reset);

    /* Read to clear the line status. */
    reg_val = UART_U0LSR;

    /* Enable the UART Interrupt */
    NVIC_EnableIRQ(UART_IRQn);
    UART_U0IER = UART_U0IER_RBR_Interrupt_Enabled;

    NVIC_EnableIRQ(UART_IRQn);
}

/* code: interrupt tx subroutines */

static inline bool uart_tx_trns()
{
    UART_U0THR = *uart.state.trns_src++;
    return uart.state.trns_src == uart.state.trns_end;
}

static inline void uart_tx_irq()
{
    switch (uart_tx_state) {
    case TX_IDLE:
    {
        for (uint_fast8_t i = 0; i < MSG_QUEUE_SIZE; i++) {
            if (!uart.queue[i].empty) {
                uart.active_queue = i;
                break;
            }
        }
        if (uart.active_queue == -1) {
            UART_U0IER &= ~(UART_U0IER_THRE_Interrupt_Enabled);
            return;
        }
        uart_tx_state = TX_SEND_HEADER;
        uart.state.trns_src = (const volatile uint8_t*)uart.queue[uart.active_queue].header;
        uart.state.trns_end = uart.state.trns_src + sizeof(struct msg_header_t);
    }
    case TX_SEND_HEADER:
    {
        if (!uart_tx_trns()) {
            return;
        }
        uint16_t len = uart.queue[uart.active_queue].header->payload_length;
        if (len == 0) {
            // allow tx-ing payloadless messages
            uart_tx_state = TX_IDLE;
            if (uart.queue[uart.active_queue].flag_to_clear) {
                *uart.queue[uart.active_queue].flag_to_clear = false;
            }
            uart.queue[uart.active_queue].empty = true;
            uart.active_queue = -1;
            break;
        }
        uart_tx_state = TX_SEND_PAYLOAD;
        uart.state.trns_src = uart.queue[uart.active_queue].data;
        uart.state.trns_end = uart.state.trns_src + len;
        break;
    }
    case TX_SEND_PAYLOAD:
    {
        if (!uart_tx_trns()) {
            return;
        }
        uart_tx_state = TX_SEND_CHECKSUM;
        uart.state.trns_src = (const uint8_t*)&uart.queue[uart.active_queue].checksum;
        uart.state.trns_end = uart.state.trns_src + sizeof(msg_checksum_t);
        break;
    }
    case TX_SEND_CHECKSUM:
    {
        if (!uart_tx_trns()) {
            return;
        }
        uart_tx_state = TX_IDLE;
        if (uart.queue[uart.active_queue].flag_to_clear) {
            *uart.queue[uart.active_queue].flag_to_clear = false;
        }
        uart.queue[uart.active_queue].empty = true;
        uart.active_queue = -1;
        break;
    }
    }
}

static inline void uart_tx_trigger()
{
    // only trigger if uart tx is in IDLE state; otherwise, it'll
    // retrigger automatically
    if (uart_tx_state == TX_IDLE) {
        UART_U0IER |= UART_U0IER_THRE_Interrupt_Enabled;
        if (UART_U0LSR & UART_U0LSR_THRE) {
            uart_tx_irq();
        }
    }
}

/* code: interrupt rx subroutines */

/**
 * Receive until either recv_dest has reached it's end or no more data
 * is available.
 *
 * @return true if the buffer has reached it's end.
 */
static inline bool uart_rx_recv()
{
    while (uart.state.recv_dest != uart.state.recv_end) {
        uint32_t status = UART_U0LSR;
        if ((status & UART_U0LSR_RDR_MASK) != UART_U0LSR_RDR_DATA) {
            return false;
        }
        *uart.state.recv_dest++ = UART_U0RBR;
    }
    return true;
}

static inline void uart_rx_irq()
{
    switch (uart_rx_state) {
    case RX_IDLE:
    {
        uart_rx_state = RX_RECEIVE_HEADER;
        uart.state.recv_dest = (uint8_t*)(&uart.state.curr_header);
        uart.state.recv_end = (uint8_t*)(&uart.state.curr_header) + sizeof(struct msg_header_t);
        // missing break is intentional: receive the first bytes immediately
    }
    case RX_RECEIVE_HEADER:
    {
        if (!uart_rx_recv()) {
            return;
        }

        switch (uart.state.curr_header.recipient) {
        case MSG_ADDRESS_LPC1114:
        {
            // this is me! either forward to local buffer or discard.
            if (appbuffer_back->in_use) {
                //~ dropped_message = true;
                //~ problem = COMM_ERR_NO_BACKBUFFER_AVAILABLE;
                uart_rx_state = RX_DUMP;
                uart.state.remaining = uart.state.curr_header.payload_length+sizeof(msg_checksum_t);
                return;
            }
            appbuffer_back->in_use = true;

            uart.state.dest_msg = appbuffer_back;
            break;
        }
        case MSG_ADDRESS_ARDUINO:
        case MSG_ADDRESS_HOST:
        {
            // use our routing buffer, if it's not blocked currently
            if (uart.route_buffer.in_use) {
                //~ dropped_message = true;
                //~ problem = COMM_ERR_NO_ROUTEBUFFER_AVAILABLE;
                uart_rx_state = RX_DUMP;
                uart.state.remaining = uart.state.curr_header.payload_length+sizeof(msg_checksum_t);
                return;
            }

            uart.state.dest_msg = &uart.route_buffer;
            break;
        }
        default:
        {
            // discard, we have no idea where to forward to
            //~ dropped_message = true;
            //~ problem = COMM_ERR_UNKNOWN_RECIPIENT;
            uart_rx_state = RX_DUMP;
            uart.state.remaining = uart.state.curr_header.payload_length+sizeof(msg_checksum_t);
            return;
        }
        }

        uart_rx_state = RX_RECEIVE_PAYLOAD;
        uart.state.recv_dest = &uart.state.dest_msg->msg.data[0];
        uart.state.recv_end = uart.state.recv_dest + uart.state.curr_header.payload_length;
        // we can smoothly continue here if more data is available
    }
    case RX_RECEIVE_PAYLOAD:
    {
        if (!uart_rx_recv()) {
            return;
        }
        uart_rx_state = RX_RECEIVE_CHECKSUM;
        uart.state.recv_dest = (uint8_t*)&uart.state.dest_msg->msg.checksum;
        uart.state.recv_end = uart.state.recv_dest + sizeof(msg_checksum_t);
    }
    case RX_RECEIVE_CHECKSUM:
    {
        if (!uart_rx_recv()) {
            return;
        }
        uart_rx_state = RX_IDLE;
        copy_header(&uart.state.dest_msg->msg.header,
                    &uart.state.curr_header);
        switch (uart.state.curr_header.recipient) {
        case MSG_ADDRESS_LPC1114:
        {
            if (!frontbuffer_locked) {
                swap_app_buffers();
                frontbuffer_locked = true;
            } else {
                backbuffer_ready = true;
            }
            NVIC_SetPendingIRQ(received_irqn);
            break;
        }
        case MSG_ADDRESS_HOST:
        {
            if (!comm_enqueue_tx_nowait(
                    &uart,
                    &uart.state.dest_msg->msg.header,
                    &uart.state.dest_msg->msg.data[0],
                    uart.state.dest_msg->msg.checksum,
                    &uart.state.dest_msg->in_use))
            {
                uart.state.dest_msg->in_use = false;
            } else {
                uart_tx_trigger();
            }
            break;
        }
        }
        break;
    }
    case RX_DUMP:
    {
        while (uart.state.remaining) {
            uint32_t status = UART_U0LSR;
            if ((status & UART_U0LSR_RDR_MASK) != UART_U0LSR_RDR_DATA) {
                return;
            }
            UART_U0SCR = UART_U0RBR;
            uart.state.remaining--;
        }
        uart_rx_state = RX_IDLE;
        break;
    }
    }
}

/* code: interrupt handler */

void UART_IRQHandler(void)
{
    uint32_t iir = UART_U0IIR;
    switch (iir & (0x7<<1)) {
    case (0x3<<1):
    case (0x2<<1):
    case (0x6<<1):
    {
        // UART rx event
        uart_rx_irq();
        break;
    }
    case (0x1<<1):
    {
        // tx buffer empty
        uart_tx_irq();
        break;
    }
    }
}
