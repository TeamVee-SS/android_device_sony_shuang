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

TARGET_SPECIFIC_HEADER_PATH += device/sony/falconss/include

# inherit from the proprietary version
include vendor/sony/falconss/BoardConfigVendor.mk

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
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8610
TARGET_NO_BOOTLOADER := true

BOARD_CUSTOM_BOOTIMG_MK := device/sony/falconss/boot/custombootimg.mk
TARGET_KERNEL_CONFIG := cyanogenmod_falconss_defconfig
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 maxcpus=2 msm_rtb.filter=0x3F ehci-hcd.park=3 msm_rtb.enable=0 lpj=192598 dwc3.maximum_speed=high dwc3_msm.prop_chg_detect=Y androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000

# Lights HAL
TARGET_PROVIDES_LIBLIGHT := true

# Power HAL
TARGET_POWERHAL_VARIANT := qcom
CM_POWERHAL_EXTENSION := qcom

# Camera
TARGET_GLOBAL_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
TARGET_PROVIDES_CAMERA_HAL := true
BOARD_CAMERA_HAVE_ISO := true
USE_DEVICE_SPECIFIC_CAMERA := true

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_USES_QCOM_RIL_RESPONSE_5_ELEMENTS := true

# Qualcomm support
TARGET_QCOM_MEDIA_VARIANT := caf-new
TARGET_QCOM_DISPLAY_VARIANT := caf-new
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
TARGET_USES_ION := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
BOARD_USES_QCOM_HARDWARE := true
USE_OPENGL_RENDERER := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true

# GPS
TARGET_NO_RPC := true
TARGET_PROVIDES_GPS_LOC_API := true

# Graphics
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# BootAnimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := false

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Audio
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_USES_QCOM_COMPRESSED_AUDIO := true
AUDIO_FEATURE_DISABLED_FM := false
AUDIO_FEATURE_DISABLED_SSR := true
AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true
BOARD_HAVE_QCOM_FM := true
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
BOARD_USES_SEPERATED_VOICE_SPEAKER := true

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

# Enable suspend during charger mode
BOARD_CHARGER_ENABLE_SUSPEND := true

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.qcom

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Encryption
TARGET_HW_DISK_ENCRYPTION := true

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

# TWRP
RECOVERY_VARIANT := omni
TW_EXTERNAL_STORAGE_PATH := "/external sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness

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
