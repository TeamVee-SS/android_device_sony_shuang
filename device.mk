#
# Copyright (C) 2016 The CyanogenMod Project
#               2017 The LineageOS Project
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

# Board device path
DEVICE_PATH := device/sony/shuang

# Product common configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_AAPT_PREBUILT_DPI := hdpi tvdpi mdpi ldpi

DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Rootdir Files
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/root/fstab.qcom:root/fstab.qcom \
    $(DEVICE_PATH)/rootdir/root/init.qcom.rc:root/init.qcom.rc \
    $(DEVICE_PATH)/rootdir/root/init.qcom.usb.rc:root/init.qcom.usb.rc \
    $(DEVICE_PATH)/rootdir/root/ueventd.qcom.rc:root/ueventd.qcom.rc

# Config Files
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(DEVICE_PATH)/rootdir/system/etc/firmware/wlan/prima/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(DEVICE_PATH)/rootdir/system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(DEVICE_PATH)/rootdir/system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(DEVICE_PATH)/rootdir/system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(DEVICE_PATH)/rootdir/system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
    $(DEVICE_PATH)/rootdir/system/etc/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(DEVICE_PATH)/rootdir/system/etc/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(DEVICE_PATH)/rootdir/system/etc/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(DEVICE_PATH)/rootdir/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(DEVICE_PATH)/rootdir/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(DEVICE_PATH)/rootdir/system/etc/sec_config:system/etc/sec_config \
    $(DEVICE_PATH)/rootdir/system/etc/thermal-engine-8610.conf:system/etc/thermal-engine-8610.conf \
    $(DEVICE_PATH)/rootdir/system/etc/wcn3620/p2p_supplicant_overlay.conf:system/etc/wcn3620/p2p_supplicant_overlay.conf \
    $(DEVICE_PATH)/rootdir/system/etc/wcn3620/wpa_supplicant_overlay.conf:system/etc/wcn3620/wpa_supplicant_overlay.conf \
    $(DEVICE_PATH)/rootdir/system/etc/wcn3620/wpa_supplicant_wcn.conf:system/etc/wcn3620/wpa_supplicant_wcn.conf \
    $(DEVICE_PATH)/rootdir/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(DEVICE_PATH)/rootdir/system/vendor/etc/audio_effects.conf:system/vendor/etc/audio_effects.conf

# Permission Files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Special Google Media Codecs
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \

# Qualcomm Display
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    libqdutils \
    libtilerenderer \
    libI420colorconvert

# Display HAL
PRODUCT_PACKAGES += \
    copybit.msm8610 \
    gralloc.msm8610 \
    hwcomposer.msm8610 \
    memtrack.msm8610

# Audio HAL
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm8610 \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.msm8610

# Audio HAL
PRODUCT_PACKAGES += \
    libalsa-intf \
    libaudioutils \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing

# Audio HAL
PRODUCT_PACKAGES += \
    audiod \
    aplay \
    amix \
    arec \
    alsaucm_test

# Tiny Files
PRODUCT_PACKAGES += \
    tinycap \
    tinymix \
    tinypcminfo \
    tinyplay

# JNI Files
PRODUCT_PACKAGES += \
    libvt_jni \
    librs_jni \
    libimscamera_jni

# SoftAP
PRODUCT_PACKAGES += \
    libQWiFiSoftApCfg \
    libqsap_sdk

# Media HAL
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libstagefrighthw

# Ligths OSS
PRODUCT_PACKAGES += \
    lights.msm8610

# QCOM OSS
PRODUCT_PACKAGES += \
   librmnetctl

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8610

PRODUCT_PACKAGES += \
    libion \
    libxml2

# RIL
PRODUCT_PACKAGES += \
   libprotobuf-cpp-full

# WiFi
PRODUCT_PACKAGES += \
    p2p_supplicant_overlay.conf \
    wpa_supplicant_overlay.conf \
    wcnss_service

# Boot tools
PRODUCT_PACKAGES += \
    dtbToolCM

# FM
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

# WiFi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

# Sony timekeep
PRODUCT_PACKAGES += \
    timekeep \
    TimeKeep

# HealthD
PRODUCT_PACKAGES += \
    charger_res_images \
    libhealthd.default

# ANT stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app

PRODUCT_GMS_CLIENTID_BASE ?= android-sonymobile

# LCD Density
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density="240"

# Qualcomm
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware="true" \
    ro.vendor.extension_library="/vendor/lib/libqc-opt.so" \
    persist.hwc.mdpcomp.enable="true" \
    persist.timed.enable="true" \
    persist.gralloc.cp.level3="1"

# OpenGL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version="196608"

# libhwui
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size="9" \
    ro.hwui.layer_cache_size="6" \
    ro.hwui.r_buffer_cache_size="0.75" \
    ro.hwui.path_cache_size="1.5" \
    ro.hwui.gradient_cache_size="0.5" \
    ro.hwui.drop_shadow_cache_size="0.75" \
    ro.hwui.texture_cache_flushrate="0.5" \
    ro.hwui.text_small_cache_width="1024" \
    ro.hwui.text_small_cache_height="256" \
    ro.hwui.text_large_cache_width="2048" \
    ro.hwui.text_large_cache_height="512"

# Debug
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type="mdp" \
    debug.egl.hw="1" \
    debug.sf.hw="1" \
    debug.sf.hwc.canUseABC="1" \
    persist.hwc.ptor.enable="1" \
    persist.sys.ssr.enable_ramdumps="1" \
    vidc.debug.level="1"

# CNE
PRODUCT_PROPERTY_OVERRIDES += \
    persist.cne.feature="1"

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.buffer.size.kb="32" \
    audio.offload.gapless.enabled="true" \
    audio.offload.video="false" \
    ro.qc.sdk.audio.ssr="false" \
    ro.qc.sdk.audio.fluencetype="fluence" \
    persist.audio.fluence.voicecall="true" \
    persist.audio.fluence.voicerec="true" \
    persist.audio.fluence.speaker="false" \
    tunnel.audio.encode="false" \
    use.voice.path.for.pcm.voip="true"

# FM Transmitter
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fm.transmitter="false"

# System props for the data modules
PRODUCT_PROPERTY_OVERRIDES += \
    ro.use_data_netmgrd="true" \
    persist.data.netmgrd.qos.enable="true" \
    ro.data.large_tcp_window_size="true" \
    persist.data.qmi.adb_logmask="0"

# Enable Power save functionality for modem
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.add_power_save="1" \
    persist.radio.apm_sim_not_pwdn="1" \
    persist.radio.oem_socket="false"

# Ringer
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple="false"

# System prop to turn off CdmaLTEPhone always
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnCdmaDevice="0"

# RILD
PRODUCT_PROPERTY_OVERRIDES += \
    ril.subscription.types="NV,RUIM" \
    rild.libpath="/vendor/lib/libril-qc-qmi-1.so"

# Set mobile data to off by default
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.mobiledata="false" \

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled="true" \
    media.stagefright.enable-aac="true" \
    media.stagefright.enable-fma2dp="true" \
    media.stagefright.enable-http="true" \
    media.stagefright.enable-player="true" \
    media.stagefright.enable-qcp="true" \
    media.stagefright.enable-scan="true" \
    mm.enable.qcom_parser="37491" \
    mm.enable.smoothstreaming="true" \
    mmp.enable.3g2="true" \
    av.offload.enable="false"

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    wlan.driver.ath="0" \
    wlan.driver.config="/system/etc/wifi/WCNSS_qcom_cfg.ini" \
    wifi.interface="wlan0"

# BlueTooth
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bluetooth.soc="smd" \
    ro.qualcomm.bt.hci_transport="smd"

# DASH video streaming
# Specify max allowed resolution/bandwidth for representations
# Set allowed avsync window during playback
PRODUCT_PROPERTY_OVERRIDES += \
    persist.dash.max.rep.resolution="1280*720" \
    persist.dash.max.rep.bandwidth="4000000" \
    persist.dash.avsync.window.msec="100"

# Camera properties
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api="1" \
    media.stagefright.legacyencoder="true" \
    media.stagefright.less-secure="true"

# IO Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq

# ART
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-filter="everything-profile" \
    dalvik.vm.image-dex2oat-filter="everything-profile" \

# Aggresively optimize art for performance
PRODUCT_PROPERTY_OVERRIDES += \
    pm.dexopt.bg-dexopt="everything-profile" \
    pm.dexopt.boot="everything-profile" \
    pm.dexopt.core-app="everything-profile" \
    pm.dexopt.first-boot="everything-profile" \
    pm.dexopt.forced-dexopt="everything" \
    pm.dexopt.install="everything-profile" \
    pm.dexopt.nsys-library="everything-profile" \
    pm.dexopt.shared-apk="everything"

# Low Memory Props
PRODUCT_PROPERTY_OVERRIDES += \
    config.disable_atlas="true" \
    ro.config.max_starting_bg="2" \
    ro.min_freq_0="787200" \
    ro.sys.fw.bg_apps_limit="8" \
    ro.config.low_ram="true" \
    persist.sys.force_highendgfx="true"

# Disable Strict Mode enabled on eng/userdebug builds
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.strictmode.disable="1" \
    persist.sys.strictmode.visual="0"

# Vendor product configurations
$(call inherit-product-if-exists, vendor/sony/shuang/shuang-vendor.mk)
