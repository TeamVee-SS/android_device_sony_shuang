#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from the proprietary version
-include vendor/sony/falconss/BoardConfigVendor.mk

BOARD_VENDOR := sony

# Platform
TARGET_BOARD_PLATFORM := msm8610
TARGET_BOARD_PLATFORM_GPU := qcom-adreno302

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8610
TARGET_NO_BOOTLOADER := true

BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG_MK := device/sony/falconss/boot/custombootimg.mk
TARGET_KERNEL_CONFIG := cyanogenmod_falconss_defconfig
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 maxcpus=2 msm_rtb.filter=0x3F ehci-hcd.park=3 msm_rtb.enable=0 lpj=192598 dwc3.maximum_speed=high dwc3_msm.prop_chg_detect=Y androidboot.selinux=permissive

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000

WLAN_MODULES:
	mkdir -p $(KERNEL_MODULES_OUT)/pronto
	mv $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko
	ln -sf /system/lib/modules/pronto/pronto_wlan.ko $(TARGET_OUT)/lib/modules/wlan.ko

TARGET_KERNEL_MODULES += WLAN_MODULES

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Use qcom power hal
TARGET_POWERHAL_VARIANT := qcom

# Qualcomm support
TARGET_QCOM_DISPLAY_VARIANT := caf-new
TARGET_USES_QCOM_BSP := true
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# Camera ABI Compatiblily
TARGET_DISPLAY_INSECURE_MM_HEAP := true

# GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)

# Enable WEBGL in WebKit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Enables Adreno RS driver
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# BootAnimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := false

# Display
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_QCOM_DISPLAY_VARIANT := caf-new
# TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_QCOM_MEDIA_VARIANT := caf-new

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Audio
TARGET_QCOM_AUDIO_VARIANT := caf
AUDIO_FEATURE_DISABLED_FM := false
AUDIO_FEATURE_DISABLED_SSR := true
BOARD_HAVE_QCOM_FM := true
AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
BOARD_USES_SEPERATED_VOICE_SPEAKER := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/falconss/bluetooth
BLUETOOTH_HCI_USE_MCT := true

# Partitions & Storage
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1436549120
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2176826880
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

# Vold
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 21
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Assert
TARGET_OTA_ASSERT_DEVICE := D2004,D2005,D2104,D2105,D2114,falconss

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := device/sony/falconss/init/init_falconss.c
TARGET_UNIFIED_DEVICE := true

# FSTAB
TARGET_RECOVERY_FSTAB := device/sony/falconss/rootdir/root/fstab.qcom

# Recovery
DEVICE_RESOLUTION := 480x800
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_FSTAB_VERSION := 2
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"

# TWRP
RECOVERY_VARIANT := omni
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_FLASH_FROM_STORAGE := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255

# Sepolicy
BOARD_SEPOLICY_DIRS += device/sony/falconss/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    app.te \
    bluetooth.te \
    device.te \
    domain.te \
    drmserver.te \
    file.te \
    hci_init.te \
    healthd.te \
    init.te \
    init_shell.te \
    keystore.te \
    kickstart.te \
    mediaserver.te \
    netd.te \
    rild.te \
    surfaceflinger.te \
    system.te \
    ueventd.te \
    wpa_supplicant.te
