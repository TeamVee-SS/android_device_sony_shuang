LOCAL_PATH := $(call my-dir)

DTBTOOL := $(HOST_OUT_EXECUTABLES)/dtbToolCM$(HOST_EXECUTABLE_SUFFIX)

uncompressed_ramdisk := $(PRODUCT_OUT)/ramdisk.cpio
$(uncompressed_ramdisk): $(INSTALLED_RAMDISK_TARGET)
	zcat $< > $@

INSTALLED_DTIMAGE_TARGET := $(PRODUCT_OUT)/dt.img
INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img

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

$(INSTALLED_BOOTIMAGE_TARGET): \
    $(PRODUCT_OUT)/kernel \
    $(uncompressed_ramdisk) \
    $(recovery_uncompressed_ramdisk) \
    $(INSTALLED_RAMDISK_TARGET) \
    $(MKBOOTIMG) $(MINIGZIP) \
    $(INTERNAL_BOOTIMAGE_FILES) \
    $(INSTALLED_DTIMAGE_TARGET)
	@echo "----- Making boot image ------"
	$(hide) rm -fr $(PRODUCT_OUT)/combinedroot
	$(hide) mkdir -p $(PRODUCT_OUT)/combinedroot/sbin
	$(hide) cp $(uncompressed_ramdisk) $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) cp $(recovery_uncompressed_ramdisk) $(PRODUCT_OUT)/combinedroot/sbin/
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
	@echo "----- Made boot image: $@ --------"

$(INSTALLED_RECOVERYIMAGE_TARGET): \
    $(MKBOOTIMG) \
    $(recovery_ramdisk) \
    $(recovery_kernel) \
    $(INSTALLED_DTIMAGE_TARGET)
	@echo "----- Making recovery image ------"
	$(hide) $(MKBOOTIMG) \
	--kernel $(PRODUCT_OUT)/kernel \
	--ramdisk $(PRODUCT_OUT)/ramdisk-recovery.img \
	--cmdline "$(BOARD_KERNEL_CMDLINE)" \
	--base $(BOARD_KERNEL_BASE) \
	--pagesize $(BOARD_KERNEL_PAGESIZE) \
	--dt $(INSTALLED_DTIMAGE_TARGET) \
	$(BOARD_MKBOOTIMG_ARGS) \
	-o $(INSTALLED_RECOVERYIMAGE_TARGET)
	@echo "----- Made recovery image: $@ --------"
