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

$(call inherit-product, device/common/gps/gps_us_supl.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

DEVICE_PACKAGE_OVERLAYS += device/sony/falconss/overlay

# Rootdir Files
PRODUCT_COPY_FILES += \
    device/sony/falconss/rootdir/root/fstab.qcom:root/fstab.qcom \
    device/sony/falconss/rootdir/root/init.qcom.rc:root/init.qcom.rc \
    device/sony/falconss/rootdir/root/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
    device/sony/falconss/rootdir/root/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    device/sony/falconss/rootdir/root/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/sony/falconss/rootdir/root/sbin/tad_static:root/sbin/tad_static \
    device/sony/falconss/rootdir/root/ueventd.qcom.rc:root/ueventd.qcom.rc

# Config Files
PRODUCT_COPY_FILES += \
    device/sony/falconss/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/sony/falconss/rootdir/system/etc/firmware/wlan/prima/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    device/sony/falconss/rootdir/system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    device/sony/falconss/rootdir/system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/sony/falconss/rootdir/system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    device/sony/falconss/rootdir/system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
    device/sony/falconss/rootdir/system/etc/flp.conf:system/etc/flp.conf \
    device/sony/falconss/rootdir/system/etc/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    device/sony/falconss/rootdir/system/etc/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny \
    device/sony/falconss/rootdir/system/etc/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    device/sony/falconss/rootdir/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    device/sony/falconss/rootdir/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/sony/falconss/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/sony/falconss/rootdir/system/etc/sec_config:system/etc/sec_config \
    device/sony/falconss/rootdir/system/etc/thermal-engine-8610.conf:system/etc/thermal-engine-8610.conf \
    device/sony/falconss/rootdir/system/etc/wcn3620/p2p_supplicant_overlay.conf:system/etc/wcn3620/p2p_supplicant_overlay.conf \
    device/sony/falconss/rootdir/system/etc/wcn3620/wpa_supplicant_overlay.conf:system/etc/wcn3620/wpa_supplicant_overlay.conf \
    device/sony/falconss/rootdir/system/etc/wcn3620/wpa_supplicant_wcn.conf:system/etc/wcn3620/wpa_supplicant_wcn.conf \
    device/sony/falconss/rootdir/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/sony/falconss/rootdir/system/vendor/etc/audio_effects.conf:system/vendor/etc/audio_effects.conf

# Permission Files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Qualcomm Display
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    liboverlay \
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
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libdashplayer \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libstagefrighthw \
    qcmediaplayer

PRODUCT_BOOT_JARS += \
    qcmediaplayer

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# GPS
PRODUCT_PACKAGES += \
    gps.msm8610

PRODUCT_PACKAGES += \
    lights.msm8610

# Qualcomm
PRODUCT_PACKAGES += \
    qrngp \
    qrngd

# Qualcomm
PRODUCT_PACKAGES += \
    camera.qcom \
    libhealthd.qcom

# WiFi
PRODUCT_PACKAGES += \
    p2p_supplicant_overlay.conf \
    wpa_supplicant_overlay.conf \
    wcnss_service

# Boot tools
PRODUCT_PACKAGES += \
    extract_ramdisk \
    dtbToolCM \
    keycheck

# FM
PRODUCT_PACKAGES += \
    FM2 \
    FMRecord \
    libqcomfm_jni \
    qcom.fmradio \

PRODUCT_GMS_CLIENTID_BASE ?= android-sonymobile

# For userdebug builds
ifeq ($(TARGET_BUILD_VARIANT),userdebug)
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure="false" \
    ro.adb.secure="false"
endif

# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config="mtp"

# LCD Density
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density="240"

# Qualcomm
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware="true" \
    ro.telephony.ril.v3="signalstrength" \
    ro.vendor.extension_library="/vendor/lib/libqc-opt.so" \
    ro.use_data_netmgrd="true" \
    persist.hwc.mdpcomp.enable="true" \
    persist.timed.enable="true" \
    persist.gralloc.cp.level3="1"

# OpenGL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version="196608"

# Debug
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type="dyn" \
    debug.egl.hw="1" \
    debug.sf.hw="1" \
    debug.gralloc.map_fb_memory="0" \
    vidc.debug.level="1"

# CNE
PRODUCT_PROPERTY_OVERRIDES += \
    persist.cne.feature="1"

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.buffer.size.kb="32" \
    audio.offload.gapless.enabled="true" \
    av.offload.enable="false" \
    ro.qc.sdk.audio.ssr="false" \
    ro.qc.sdk.audio.fluencetype="fluence" \
    persist.audio.fluence.voicecall="true" \
    persist.audio.fluence.voicerec="true" \
    persist.audio.fluence.speaker="false" \
    tunnel.audio.encode="false"

# FM Transmitter
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fm.transmitter="false"

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    gsm.version.baseband="M8610B-AAAANAZM-1.0.4060" \
    persist.radio.apm_sim_not_pwdn="1" \
    ril.subscription.types="NV,RUIM" \
    rild.libpath="/vendor/lib/libril-qc-qmi-1.so" \
    ro.telephony.call_ring.multiple="false" \
    telephony.lteOnCdmaDevice="0" \
    persist.radio.rat_on="legacy"

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
    mmp.enable.3g2="true"

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    wlan.driver.ath="0" \
    wlan.driver.config="/system/etc/wifi/WCNSS_qcom_cfg.ini" \
    wifi.interface="wlan0"

# SDCard
PRODUCT_PROPERTY_OVERRIDES += \
    persist.fuse_sdcard="true"

# BlueTooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport="smd"

# DASH video streaming
# Specify max allowed resolution/bandwidth for representations
# Set allowed avsync window during playback
PRODUCT_PROPERTY_OVERRIDES += \
    persist.dash.max.rep.resolution="1280*720" \
    persist.dash.max.rep.bandwidth="4000000" \
    persist.dash.avsync.window.msec="100"

# Liblight
PRODUCT_PROPERTY_OVERRIDES += \
    sys.lights.barled="true"

# Force Camera Portability API, since newer camera API isn't supported.
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api="1"
