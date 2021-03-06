CC = avr-gcc
CFLAGS ?= -Wall -Wextra -Werror -Os -std=gnu11
CFLAGS += -mmcu=attiny2313a -fstack-usage -Wstack-usage=64 -I../../ -I. -Wno-attributes -fdata-sections -ffunction-sections -Wl,--gc-sections

OBJCOPY = avr-objcopy
OCFLAGS ?= --strip-unneeded

SIZE = avr-size

PROGRAM = main
SRCS = main.c uart.c uart_onewire.c USI_TWI_Master.c systick.c
COMMONDEPS = config.h uart.h uart_onewire.h allstrings.h USI_TWI_Master.h systick.h

OBJS = $(addsuffix .o,$(basename $(SRCS)))
PRODUCTS = $(OBJS) $(PROGRAM).hex $(PROGRAM).elf

$(PROGRAM).hex: $(PROGRAM).elf
	$(OBJCOPY) $(OCFLAGS) -O ihex $< $@

$(PROGRAM).elf: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@
	@echo -e "\nbinary size:"
	@$(SIZE) $@
	@echo

allstrings.h: strings.list utils/mkstrings.py
	./utils/mkstrings.py $< > $@

$(OBJS): %.o: %.c $(COMMONDEPS)
	$(CC) -c $(CFLAGS) $< -o $@

%.s: %.c $(COMMONDEPS)
	$(CC) -S -fverbose-asm -c $(CFLAGS) $< -o $@

.PHONY: clean

clean:
	rm -f $(PRODUCTS)
