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

# SBIN Rootdir files
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/root/sbin/wait4tad_static:root/sbin/wait4tad_static
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/root/sbin/tad_static:root/sbin/tad_static

# Rootdir files
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/root/fstab.qcom:root/fstab.qcom
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/root/init.qcom.rc:root/init.qcom.rc
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/root/init.qcom.sh:root/init.qcom.sh
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/root/init.qcom.class_main.sh:root/init.qcom.class_main.sh
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/root/init.qcom.fm.sh:root/init.qcom.fm.sh
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/root/init.qcom.usb.rc:root/init.qcom.usb.rc
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/root/init.qcom.wifi.sh:root/init.qcom.wifi.sh
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/root/ueventd.qcom.rc:root/ueventd.qcom.rc

# Config Files
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/media_codecs.xml:system/etc/media_codecs.xml
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/media_profiles.xml:system/etc/media_profiles.xml
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/sec_config:system/etc/sec_config
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/snd_soc_msm/snd_soc_msm_8x10_wcd:system/etc/snd_soc_msm/snd_soc_msm_8x10_wcd
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/snd_soc_msm/snd_soc_msm_8x10_wcd_skuaa:system/etc/snd_soc_msm/snd_soc_msm_8x10_wcd_skuaa
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/snd_soc_msm/snd_soc_msm_8x10_wcd_skuab:system/etc/snd_soc_msm/snd_soc_msm_8x10_wcd_skuab
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/thermal-engine-8610.conf:system/etc/thermal-engine-8610.conf

# WIFI Config Files
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/wcn3620/p2p_supplicant_overlay.conf:system/etc/wcn3620/p2p_supplicant_overlay.conf
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/wcn3620/wpa_supplicant_overlay.conf:system/etc/wcn3620/wpa_supplicant_overlay.conf
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/wcn3620/wpa_supplicant_wcn.conf:system/etc/wcn3620/wpa_supplicant_wcn.conf

# HostAPD Config Files
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/etc/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# KeyLayout Files
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/usr/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/usr/keylayout/ft5x06_ts.kl:system/usr/keylayout/ft5x06_ts.kl
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl
PRODUCT_COPY_FILES += device/sony/falconss/rootdir/system/usr/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl

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

PRODUCT_PACKAGES += libstagefrighthw
PRODUCT_PACKAGES += libOmxCore
PRODUCT_PACKAGES += libmm-omxcore
PRODUCT_PACKAGES += libOmxVdec
PRODUCT_PACKAGES += libOmxVdecHevc
PRODUCT_PACKAGES += libOmxVenc
PRODUCT_PACKAGES += qcmediaplayer

PRODUCT_PACKAGES += libOmxAacEnc
PRODUCT_PACKAGES += libOmxAmrEnc
PRODUCT_PACKAGES += libOmxEvrcEnc
PRODUCT_PACKAGES += libOmxQcelp13Enc

PRODUCT_PACKAGES += libdivxdrmdecrypt
PRODUCT_PACKAGES += libdashplayer

PRODUCT_PACKAGES += librs_jni
PRODUCT_PACKAGES += com.android.future.usb.accessory

# FM
#PRODUCT_PACKAGES += FM2
#PRODUCT_PACKAGES += FMRecord
#PRODUCT_PACKAGES += libqcomfm_jni
#PRODUCT_PACKAGES += qcom.fmradio

# Lights
PRODUCT_PACKAGES += lights.msm8610

# GPS
PRODUCT_PACKAGES += gps.msm8610

PRODUCT_GMS_CLIENTID_BASE ?= android-sonymobile

# QRNG
PRODUCT_PACKAGES += qrngp

PRODUCT_PACKAGES += \
    wlan_module_symlink \
    wlan_persist_symlink \
    wcnss_service

# Boot bins
PRODUCT_PACKAGES += extract_elf_ramdisk
PRODUCT_PACKAGES += dtbToolCM

PRODUCT_COPY_FILES += kernel/sony/falconss/drivers/staging/prima/firmware_bin/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat
PRODUCT_COPY_FILES += kernel/sony/falconss/drivers/staging/prima/firmware_bin/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini

# Inhert dalvik heap values from aosp
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Call System Props
include device/sony/falconss/system_prop.mk
