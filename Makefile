ifneq ($(KERNELRELEASE),)
obj-m := mcp251xfd.o
mcp251xfd-objs	:= mcp25xxfd_base.o  \
		   mcp25xxfd_can_debugfs.o  \
		   mcp25xxfd_can_int.o  \
		   mcp25xxfd_can_tx.o  \
		   mcp25xxfd_cmd.o  \
		   mcp25xxfd_debugfs.o  \
		   mcp25xxfd_gpio.o \
		   mcp25xxfd_can.o   \
		   mcp25xxfd_can_fifo.o  \
		   mcp25xxfd_can_rx.o   \
		   mcp25xxfd_clock.o   \
		   mcp25xxfd_crc.o  \
		   mcp25xxfd_ecc.o   \
		   mcp25xxfd_int.o
else
	KDIR := /lib/modules/$(shell uname -r)/build/
	PWD  := $(shell pwd)
all:
	@echo "This driver Support  mcp251xfd"
	$(MAKE) -w -C $(KDIR) M=$(PWD) modules
clean:
	$(MAKE) -w -C $(KDIR) M=$(PWD) clean
endif

