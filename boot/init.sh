#!/sbin/busybox sh
set +x
_PATH=${PATH}
export PATH="/sbin"

busybox cd /
busybox date >> boot.txt
exec >> boot.txt 2>&1
busybox rm /init

triggerled() {
# Use this <http://www.nameacolor.com/Color%20numbers.htm>
busybox echo ${1} > /sys/class/leds/red/brightness
busybox echo ${2} > /sys/class/leds/green/brightness
busybox echo ${3} > /sys/class/leds/notification/brightness
busybox echo ${4} > /sys/class/leds/lm3533-light-sns/rgb_brightness
}

# include device specific vars
export BOOTREC_EVENT_NODE="/dev/input/event6 c 13 70"
export BOOTREC_EVENT="/dev/input/event6"
export BOOTREC_FOTA_NODE="/dev/block/mmcblk0p16 b 179 16"
export BOOTREC_FOTA="/dev/block/mmcblk0p16"

# create directories
busybox mkdir -m 755 -p /dev/block
busybox mkdir -m 755 -p /dev/input
busybox mkdir -m 555 -p /proc
busybox mkdir -m 755 -p /sys

# create device nodes
busybox mknod -m 600 /dev/block/mmcblk0 b 179 0
busybox mknod -m 600 ${BOOTREC_EVENT_NODE}
busybox mknod -m 600 ${BOOTREC_FOTA_NODE}
busybox mknod -m 666 /dev/null c 1 3

# mount filesystems
busybox mount -t proc proc /proc
busybox mount -t sysfs sysfs /sys

# trigger ON green LED
triggerled 0 255 0 65280

# trigger vibration
busybox echo 100 > /sys/class/timed_output/vibrator/enable

# keycheck
busybox cat ${BOOTREC_EVENT} > /dev/keycheck&
busybox sleep 3

# boot decision
if [ -s /dev/keycheck ] || busybox grep -q warmboot=0x77665502 /proc/cmdline
then
	# trigger ON cyan LED for recovery
	triggerled 0 255 255 65535

	# extract recovery ramdisk from fota
	extract_elf_ramdisk -i ${BOOTREC_FOTA} -o /sbin/ramdisk-recovery.cpio -t / -c

	# recovery ramdisk
	load_image="/sbin/ramdisk-recovery.cpio"
	busybox echo "RECOVERY BOOT" >> boot.txt
else
	# android ramdisk
	load_image="/sbin/ramdisk.cpio"
	busybox echo "ANDROID BOOT" >> boot.txt
fi

# kill the keycheck process
busybox pkill -f "busybox cat ${BOOTREC_EVENT}"

# trigger OFF LED
triggerled 0 0 0 0

# unpack the ramdisk image
busybox cpio -i < ${load_image}

busybox umount /proc
busybox umount /sys

busybox rm -fr /dev/*
busybox date >> boot.txt
export PATH=${_PATH}
exec /init
