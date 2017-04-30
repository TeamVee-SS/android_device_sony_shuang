LOCAL_PATH := $(call my-dir)

DTBTOOL := $(HOST_OUT_EXECUTABLES)/dtbToolCM$(HOST_EXECUTABLE_SUFFIX)
INITSONY := $(PRODUCT_OUT)/utilities/init_sony

uncompressed_ramdisk := $(PRODUCT_OUT)/ramdisk.cpio
$(uncompressed_ramdisk): $(INSTALLED_RAMDISK_TARGET)
	zcat $< > $@

INSTALLED_DTIMAGE_TARGET := $(PRODUCT_OUT)/dt.img
$(INSTALLED_DTIMAGE_TARGET): \
		$(DTBTOOL) \
		$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr \
		$(INSTALLED_KERNEL_TARGET)
	@echo "----- Making DT image ------"
	$(call pretty,"Target DT image: $@")
	$(hide) $(DTBTOOL) -2 \
	        -o $(INSTALLED_DTIMAGE_TARGET) \
	        -s $(BOARD_KERNEL_PAGESIZE) \
	        -p $(KERNEL_OUT)/scripts/dtc/ \
	        $(KERNEL_OUT)/arch/arm/boot/
	@echo "----- Made DT image: $@ ------"

recovery_uncompressed_ramdisk := $(PRODUCT_OUT)/ramdisk-recovery.cpio
recovery_uncompressed_device_ramdisk := $(PRODUCT_OUT)/ramdisk-recovery-device.cpio
$(recovery_uncompressed_device_ramdisk): $(MKBOOTFS) \
		$(INTERNAL_RECOVERYIMAGE_FILES) \
		$(recovery_initrc) $(recovery_sepolicy) $(recovery_kernel) \
		$(INSTALLED_2NDBOOTLOADER_TARGET) \
		$(recovery_build_prop) $(recovery_resource_deps) $(recovery_root_deps) \
		$(recovery_fstab) \
		$(RECOVERY_INSTALL_OTA_KEYS) \
		$(INTERNAL_BOOTIMAGE_FILES)
	$(call build-recoveryramdisk)
	@echo "----- Making uncompressed recovery ramdisk ------"
	$(hide) $(MKBOOTFS) $(TARGET_RECOVERY_ROOT_OUT) > $@
	$(hide) rm -f $(recovery_uncompressed_ramdisk)
	$(hide) cp $(recovery_uncompressed_device_ramdisk) $(recovery_uncompressed_ramdisk)

recovery_ramdisk := $(PRODUCT_OUT)/ramdisk-recovery.img
$(recovery_ramdisk): $(MINIGZIP) \
		$(recovery_uncompressed_device_ramdisk)
	@echo "----- Making compressed recovery ramdisk ------"
	$(hide) $(MINIGZIP) < $(recovery_uncompressed_ramdisk) > $@

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
$(INSTALLED_BOOTIMAGE_TARGET): \
		$(PRODUCT_OUT)/kernel \
		$(uncompressed_ramdisk) \
		$(recovery_uncompressed_device_ramdisk) \
		$(INSTALLED_RAMDISK_TARGET) \
		$(INITSONY) \
		$(PRODUCT_OUT)/utilities/toybox \
		$(PRODUCT_OUT)/utilities/keycheck \
		$(MKBOOTIMG) $(MINIGZIP) \
		$(INTERNAL_BOOTIMAGE_FILES) \
		$(INSTALLED_DTIMAGE_TARGET)
	@echo "----- Making boot image ------"
	$(hide) rm -fr $(PRODUCT_OUT)/combinedroot
	$(hide) cp -a $(PRODUCT_OUT)/root $(PRODUCT_OUT)/combinedroot
	$(hide) mkdir -p $(PRODUCT_OUT)/combinedroot/sbin
	$(hide) cp $(recovery_uncompressed_ramdisk) $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) cp $(PRODUCT_OUT)/utilities/keycheck $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) cp $(PRODUCT_OUT)/utilities/toybox $(PRODUCT_OUT)/combinedroot/sbin/toybox_init

	$(hide) cp $(INITSONY) $(PRODUCT_OUT)/combinedroot/sbin/init_sony
	$(hide) chmod 755 $(PRODUCT_OUT)/combinedroot/sbin/init_sony
	$(hide) mv $(PRODUCT_OUT)/combinedroot/init $(PRODUCT_OUT)/combinedroot/init.real
	$(hide) ln -s sbin/init_sony $(PRODUCT_OUT)/combinedroot/init

	$(hide) $(MKBOOTFS) $(PRODUCT_OUT)/combinedroot/ > $(PRODUCT_OUT)/combinedroot.cpio
	$(hide) cat $(PRODUCT_OUT)/combinedroot.cpio | gzip > $(PRODUCT_OUT)/combinedroot.fs
	$(hide) $(MKBOOTIMG) \
	        --kernel $(PRODUCT_OUT)/kernel \
	        --ramdisk $(PRODUCT_OUT)/combinedroot.fs \
	        --cmdline "$(BOARD_KERNEL_CMDLINE)" \
	        --base $(BOARD_KERNEL_BASE) \
	        --pagesize $(BOARD_KERNEL_PAGESIZE) \
	        --dt $(INSTALLED_DTIMAGE_TARGET) \
	        $(BOARD_MKBOOTIMG_ARGS) \
	        -o $(INSTALLED_BOOTIMAGE_TARGET)
	$(call pretty,"Made boot image: $@")

INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): \
		$(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel) \
		$(INSTALLED_DTIMAGE_TARGET)
	@echo "----- Making recovery image ------"
	$(call build-recoveryimage-target, $@)
	$(hide) $(MKBOOTIMG) \
	        --kernel $(PRODUCT_OUT)/kernel \
	        --ramdisk $(recovery_ramdisk) \
	        --cmdline "$(BOARD_KERNEL_CMDLINE)" \
	        --base $(BOARD_KERNEL_BASE) \
	        --pagesize $(BOARD_KERNEL_PAGESIZE) \
	        --dt $(INSTALLED_DTIMAGE_TARGET) \
	        $(BOARD_MKBOOTIMG_ARGS) \
	        -o $(INSTALLED_RECOVERYIMAGE_TARGET)
	$(call pretty,"Made recovery image: $@")
