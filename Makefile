KERNEL_VERSION			:= $(shell uname -r)
KERNEL_DIR				:= /lib/modules/$(KERNEL_VERSION)/build
KERNEL_DRVIVERS_NET_USB := /lib/modules/$(KERNEL_VERSION)/kernel/drivers/net/usb/
PWD						:= $(shell pwd)
MODULE_NAME 			:= qf9700
obj-m					:= $(MODULE_NAME).o
ko-file					:= $(MODULE_NAME).ko

all: 
	@echo "Building QF9700 USB2NET chip driver..."
	@(cd $(KERNEL_DIR) && make -C $(KERNEL_DIR) KBUILD_EXTMOD=$(PWD) CROSS_COMPILE=$(CROSS_COMPILE) modules)

install:
	@echo "install chip driver $(MODULE_NAME) ..."
	make delete
	cp -f $(ko-file) $(KERNEL_DRVIVERS_NET_USB)$(ko-file)
	depmod
	modprobe usbnet
	insmod $(KERNEL_DRVIVERS_NET_USB)$(ko-file)

delete:
	@echo "delete chip driver $(MODULE_NAME) ..."
	modprobe $(MODULE_NAME)
	rmmod $(MODULE_NAME)
	rm -f $(KERNEL_DRVIVERS_NET_USB)$(ko-file)
	depmod 
	modprobe usbnet

clean:
	-rm -f *.o *.ko .*.cmd .*.flags .mii.mod.o.d *.mod* Module.symvers Module.markers modules.order version.h
	-rm -rf .tmp_versions

