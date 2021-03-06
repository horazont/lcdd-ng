#ifndef _HOSTCOM_H
#define _HOSTCOM_H

#include "common/comm.h"

#define COMM_ERR_NONE 0
#define COMM_ERR_NO_BACKBUFFER_AVAILABLE 1
#define COMM_ERR_NO_ROUTEBUFFER_AVAILABLE 2
#define COMM_ERR_UNKNOWN_RECIPIENT 3

#define TMR_COMM_TIMEOUT_TCR TMR_TMR32B0TCR
#define TMR_COMM_TIMEOUT_TC TMR_TMR32B0TC
#define TMR_COMM_TIMEOUT_IR TMR_TMR32B0IR
#define TMR_COMM_TIMEOUT_IR_RESET TMR_TMR32B0IR_MR0

typedef enum {
    RXU_IDLE,
    RXU_RECEIVE_HEADER,
    RXU_RECEIVE_PAYLOAD,
    RXU_RECEIVE_CHECKSUM,
    RXU_DUMP
} uart_rx_state_t;

extern volatile uint32_t last_i2c_state;
extern volatile uart_rx_state_t uart_rx_state;

/**
 * Initialize the communication subsystem.
 *
 * This initializes the UART and the I²C bus.
 *
 * @param uart_baudrate baudrate to communicate with over the UART.
 * @param i2c_bitrate the bitrate to communicate with over the I²C bus.
 */
void comm_init(const uint32_t uart_baudrate,
               const uint32_t i2c_bitrate);

/**
 * Return received message. This should be called from the RX interrupt
 * handler.
 *
 * @return NULL if no message is currently available, a pointer to the
 *         buffer otherwise.
 */
struct msg_buffer_t *comm_get_rx_message();

/**
 * Release the received message. You MUST call this after the processing
 * of the message has finished. Otherwise, no further messages can be
 * received.
 *
 * @return true if another message is waiting to be processed, false
 *         otherwise.
 */
bool comm_release_rx_message();

/**
 * Transmit an acknowledge message to the given recipient.
 *
 * @param recipient target adress to send to
 * @return status code indicating success or failure of the transmission
 */
enum msg_status_t comm_tx_ack(const msg_address_t recipient);

/**
 * Transmit an not-acknowledged message to the given recipient.
 *
 * @param recipient target adress to send to
 * @param nak_code error code (4 bits)
 * @return status code indicating success or failure of the transmission
 */
enum msg_status_t comm_tx_nak(
    const msg_address_t recipient,
    const uint8_t nak_code);

void comm_debug_tx_pong();

/**
 * Transmit a message over the appropriate link. The link is detected
 * by investigating the recipient field in the header.
 *
 * payload may be NULL. In that case, no payload is transmitted
 * (checksum is ignored too) and payload_length in hdr MUST be 0 too.
 *
 * @param hdr message header
 * @param payload pointer to a buffer containing the payload
 * @param checksum checksum of the buffer
 * @return status code indicating success or failure of the transmission
 */
enum msg_status_t comm_tx_message(
    const struct msg_header_t *hdr,
    const uint8_t *payload,
    const msg_checksum_t checksum);

#endif
