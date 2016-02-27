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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Rootdir files
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/sony/falconss/rootdir/root,root)

# Config Files
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/sony/falconss/rootdir/system,system)

# TWRP FSTAB V1
$(shell mkdir -p out/target/product/falconss/recovery/root/etc)
$(shell cp device/sony/falconss/recovery/twrp.fstab out/target/product/falconss/recovery/root/etc/twrp.fstab)
# WORKAROUND HACK

# These are the hardware-specific features
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

DEVICE_PACKAGE_OVERLAYS += device/sony/falconss/overlay

# Charger
PRODUCT_PACKAGES += charger
PRODUCT_PACKAGES += charger_res_images

# Display
PRODUCT_PACKAGES += gralloc.msm8610
PRODUCT_PACKAGES += libgenlock
PRODUCT_PACKAGES += copybit.msm8610
PRODUCT_PACKAGES += hwcomposer.msm8610
PRODUCT_PACKAGES += memtrack.msm8610
PRODUCT_PACKAGES += power.msm8610
PRODUCT_PACKAGES += liboverlay

# QCOM Display
PRODUCT_PACKAGES += libmemalloc
PRODUCT_PACKAGES += libqdutils
PRODUCT_PACKAGES += libtilerenderer

PRODUCT_PACKAGES += audio.msm8610
PRODUCT_PACKAGES += audio_policy.msm8610
PRODUCT_PACKAGES += libalsa-intf
PRODUCT_PACKAGES += libaudioutils
PRODUCT_PACKAGES += aplay
PRODUCT_PACKAGES += amix
PRODUCT_PACKAGES += arec
PRODUCT_PACKAGES += alsaucm_test

# VT_JNI
PRODUCT_PACKAGES += libvt_jni
PRODUCT_PACKAGES += libimscamera_jni

# Keystore
PRODUCT_PACKAGES += keystore.msm8610

PRODUCT_PACKAGES += audiod
PRODUCT_PACKAGES += audio.primary.msm8610
PRODUCT_PACKAGES += audio.a2dp.default
PRODUCT_PACKAGES += audio.usb.default
PRODUCT_PACKAGES += audio.r_submix.default
PRODUCT_PACKAGES += libaudio-resampler
PRODUCT_PACKAGES += tinycap
PRODUCT_PACKAGES += tinymix
PRODUCT_PACKAGES += tinypcminfo
PRODUCT_PACKAGES += tinyplay
PRODUCT_PACKAGES += libqcompostprocbundle
PRODUCT_PACKAGES += libqcomvisualizer
PRODUCT_PACKAGES += libqcomvoiceprocessing

# Qcom SoftAP & wifi
PRODUCT_PACKAGES += libQWiFiSoftApCfg

PRODUCT_PACKAGES += libc2dcolorconvert
PRODUCT_PACKAGES += libstagefrighthw
PRODUCT_PACKAGES += libOmxCore
PRODUCT_PACKAGES += libmm-omxcore
PRODUCT_PACKAGES += libOmxVdec
PRODUCT_PACKAGES += libOmxVdecHevc
PRODUCT_PACKAGES += libOmxVenc
PRODUCT_PACKAGES += qcmediaplayer

#PRODUCT_PACKAGES += libOmxAacEnc
#PRODUCT_PACKAGES += libOmxAmrEnc
PRODUCT_PACKAGES += libOmxEvrcEnc
PRODUCT_PACKAGES += libOmxQcelp13Enc

PRODUCT_PACKAGES += libdivxdrmdecrypt
PRODUCT_PACKAGES += libdashplayer

PRODUCT_PACKAGES += librs_jni
PRODUCT_PACKAGES += com.android.future.usb.accessory

# FM
PRODUCT_PACKAGES += FM2
PRODUCT_PACKAGES += FMRecord
PRODUCT_PACKAGES += libqcomfm_jni
PRODUCT_PACKAGES += qcom.fmradio

# Lights
PRODUCT_PACKAGES += lights.msm8610

# GPS
PRODUCT_PACKAGES += gps.msm8610

# Misc
PRODUCT_PACKAGES += curl
PRODUCT_PACKAGES += libbson
PRODUCT_PACKAGES += libcurl
PRODUCT_PACKAGES += tcpdump

PRODUCT_GMS_CLIENTID_BASE ?= android-sonymobile

# Boot bins
PRODUCT_PACKAGES += extract_elf_ramdisk
PRODUCT_PACKAGES += dtbToolCM

# Setup Wizard
PRODUCT_PACKAGES += CMAccount

PRODUCT_COPY_FILES += kernel/sony/falconss/drivers/staging/prima/firmware_bin/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat
PRODUCT_COPY_FILES += kernel/sony/falconss/drivers/staging/prima/firmware_bin/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini

# Inhert dalvik heap values from aosp
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Call System Props
include device/sony/falconss/system_prop.mk
