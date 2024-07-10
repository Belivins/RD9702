1)make
2)cp  /lib/modules/`uname -r`/kernel/drivers/net/usb/rd9700.ko
3)depmod 
4)modprobe usbnet
5)insmod /lib/modules/`uname -r`/kernel/drivers/net/usb/rd9700.ko


For linux kernel 5.10.0-28-amd64: 
1)make
2)sudo cp qf9700.ko /lib/modules/5.10.0-28-amd64/kernel/drivers/net/usb/qf9700.ko
3)sudo depmod 
4)sudo modprobe usbnet

5)sudo insmod /lib/modules/5.10.0-28-amd64/kernel/drivers/net/usb/qf9700.ko

###########################
QFF:
sudo cp qf9700.ko /lib/modules/5.10.0-28-amd64/kernel/drivers/net/usb/qf9700.ko
sudo depmod 
sudo modprobe usbnet
sudo insmod /lib/modules/5.10.0-28-amd64/kernel/drivers/net/usb/qf9700.ko
sudo modprobe qf9700 dyndbg

sudo modprobe qf9700
sudo rmmod qf9700
sudo rmmod /lib/modules/5.10.0-28-amd64/kernel/drivers/net/usb/qf9700.ko
sudo rm -f /lib/modules/`uname -r`/kernel/drivers/net/usb/qf9700.ko
sudo depmod 
sudo modprobe usbnet
lsmod | grep qf9700
#######################
