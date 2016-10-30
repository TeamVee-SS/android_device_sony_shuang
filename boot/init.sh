#!/sbin/busybox sh
set +x
exec >> /boot.txt 2>&1
/sbin/busybox rm /init

triggerled() {
# Use this <http://www.nameacolor.com/Color%20numbers.htm>
/sbin/busybox echo ${1} > /sys/class/leds/red/brightness
/sbin/busybox echo ${2} > /sys/class/leds/green/brightness
/sbin/busybox echo ${3} > /sys/class/leds/notification/brightness
/sbin/busybox echo ${4} > /sys/class/leds/lm3533-light-sns/rgb_brightness
}

# include device specific vars
export BOOTREC_EVENT_NODE="/dev/input/event6 c 13 70"
export BOOTREC_EVENT="/dev/input/event6"
export BOOTREC_FOTA_NODE="/dev/block/mmcblk0p16 b 179 16"
export BOOTREC_FOTA="/dev/block/mmcblk0p16"

# create directories
/sbin/busybox mkdir -m 755 -p /dev/block
/sbin/busybox mkdir -m 755 -p /dev/input
/sbin/busybox mkdir -m 555 -p /proc
/sbin/busybox mkdir -m 755 -p /sys

# create device nodes
/sbin/busybox mknod -m 600 /dev/block/mmcblk0 b 179 0
/sbin/busybox mknod -m 600 ${BOOTREC_EVENT_NODE}
/sbin/busybox mknod -m 600 ${BOOTREC_FOTA_NODE}
/sbin/busybox mknod -m 666 /dev/null c 1 3

# mount filesystems
/sbin/busybox mount -t proc proc /proc
/sbin/busybox mount -t sysfs sysfs /sys

# trigger ON green LED
triggerled 0 255 0 65280

# trigger vibration
/sbin/busybox echo 100 > /sys/class/timed_output/vibrator/enable

# keycheck
/sbin/busybox cat ${BOOTREC_EVENT} > /dev/keycheck&
/sbin/busybox sleep 3

# boot decision
if [ -s /dev/keycheck ] || /sbin/busybox grep -q warmboot=0x77665502 /proc/cmdline
then
	# trigger ON cyan LED for recovery
	triggerled 0 255 255 65535

	# extract recovery ramdisk from fota
	/sbin/extract_elf_ramdisk -i ${BOOTREC_FOTA} -o /sbin/ramdisk-recovery.cpio -t / -c

	# recovery ramdisk
	load_image="/sbin/ramdisk-recovery.cpio"
	/sbin/busybox echo "RECOVERY BOOT"
else
	# android ramdisk
	load_image="/sbin/ramdisk.cpio"
	/sbin/busybox echo "ANDROID BOOT"
fi

# kill the keycheck process
/sbin/busybox pkill -f "busybox cat ${BOOTREC_EVENT}"

# trigger OFF LED
triggerled 0 0 0 0

# unpack the ramdisk image
/sbin/busybox cpio -i < ${load_image}

/sbin/busybox umount /proc
/sbin/busybox umount /sys
/sbin/busybox rm -fr /dev/*

exec /init
