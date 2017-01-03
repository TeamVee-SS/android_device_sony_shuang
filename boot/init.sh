#!/sbin/busybox sh
set +x
exec >> /boot.txt 2>&1
/sbin/busybox rm /init

triggerled_rgb() {
/sbin/busybox echo "${1}" > "/sys/class/leds/red/brightness"
/sbin/busybox echo "${2}" > "/sys/class/leds/green/brightness"
/sbin/busybox echo "${3}" > "/sys/class/leds/notification/brightness"
/sbin/busybox echo "$(($(($((${1} & 0xFF)) << 16)) + $(($((${2} & 0xFF)) << 8)) + $((${3} & 0xFF))))" > "/sys/class/leds/lm3533-light-sns/rgb_brightness"
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

if [ $(/sbin/busybox grep -q "androidboot.mode=charger" /proc/cmdline; echo $?) == "0" ]
then
	# prevent any recovery access on charger powerup
	/sbin/busybox echo "DIRECT ANDROID BOOT"
elif [ $(/sbin/busybox grep -q "mrom_kexecd=1" /proc/cmdline; echo $?) == "0" ]
then
	# prevent any recovery access on multirom kexec
	/sbin/busybox echo "DIRECT ANDROID BOOT"
else
	# exit code zero of grep recovery reboot command stored on cmdline
	if [ $(/sbin/busybox grep -q "warmboot=0x77665502" /proc/cmdline; echo $?) == "0" ]
	then
		# warning
		/sbin/busybox echo "DIRECT RECOVERY BOOT"

		# go direct to recovery
		export BOOTREC_GOTO_RECOVERY="1"
	else
		# trigger ON green LED
		triggerled_rgb 0 255 0

		# trigger vibration
		/sbin/busybox echo 100 > /sys/class/timed_output/vibrator/enable

		# go to recovery if keycheck return 41 (Vol-) or 42 (Vol+)
		/sbin/busybox timeout -t 3 /sbin/keycheck
		if [[ $? == "41" || $? == "42" ]]; then export BOOTREC_GOTO_RECOVERY="1"; fi
	fi
fi

# boot decision
if [ ${BOOTREC_GOTO_RECOVERY} == "1" ]
then
	# trigger ON cyan LED for recovery
	triggerled_rgb 0 255 255

	# extract recovery ramdisk from fota
	/sbin/extract_ramdisk -i ${BOOTREC_FOTA} -o /sbin/ramdisk-recovery.cpio -t / -c

	# recovery ramdisk
	BOOTREC_RAMDISK_IMAGE="/sbin/ramdisk-recovery.cpio"
	/sbin/busybox echo "RECOVERY BOOT"
else
	# android ramdisk
	BOOTREC_RAMDISK_IMAGE="/sbin/ramdisk.cpio"
	/sbin/busybox echo "ANDROID BOOT"
fi

# trigger OFF LED
triggerled_rgb 0 0 0

# unpack the ramdisk image
/sbin/busybox cpio -i < ${BOOTREC_RAMDISK_IMAGE}

# cleanup
/sbin/busybox umount /proc
/sbin/busybox umount /sys
/sbin/busybox rm -fr /dev/*

# finally execute real init
exec /init
