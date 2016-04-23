#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# 	http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# For userdebug builds
ifeq ($(TARGET_BUILD_VARIANT),userdebug)
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure="false"
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure="false"
endif
# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config="mtp"
# Density
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density="240"
# QCOM
PRODUCT_PROPERTY_OVERRIDES += com.qc.hardware="true"
PRODUCT_PROPERTY_OVERRIDES += ro.vendor.extension_library="/vendor/lib/libqc-opt.so"
PRODUCT_PROPERTY_OVERRIDES += ro.use_data_netmgrd="true"
PRODUCT_PROPERTY_OVERRIDES += persist.timed.enable="true"
# OPENGL
PRODUCT_PROPERTY_OVERRIDES += ro.opengles.version="196608"
# Debug
PRODUCT_PROPERTY_OVERRIDES += debug.sf.fb_always_on="1"
PRODUCT_PROPERTY_OVERRIDES += debug.egl.hw="1"
PRODUCT_PROPERTY_OVERRIDES += debug.gralloc.map_fb_memory="0"
PRODUCT_PROPERTY_OVERRIDES += debug.composition.type="dyn"
# Persist
PRODUCT_PROPERTY_OVERRIDES += persist.hwc.mdpcomp.enable="true"
PRODUCT_PROPERTY_OVERRIDES += persist.cne.feature="1"
# Audio
PRODUCT_PROPERTY_OVERRIDES += audio.offload.buffer.size.kb="32"
PRODUCT_PROPERTY_OVERRIDES += audio.offload.gapless.enabled="true"
PRODUCT_PROPERTY_OVERRIDES += av.offload.enable="false"
PRODUCT_PROPERTY_OVERRIDES += ro.qc.sdk.audio.ssr="false"
PRODUCT_PROPERTY_OVERRIDES += ro.qc.sdk.audio.fluencetype="fluence"
PRODUCT_PROPERTY_OVERRIDES += persist.audio.fluence.voicecall="true"
PRODUCT_PROPERTY_OVERRIDES += persist.audio.fluence.voicerec="true"
PRODUCT_PROPERTY_OVERRIDES += persist.audio.fluence.speaker="false"
PRODUCT_PROPERTY_OVERRIDES += tunnel.audio.encode="false"
PRODUCT_PROPERTY_OVERRIDES += use.voice.path.for.pcm.voip="true"
# FM Transmitter
PRODUCT_PROPERTY_OVERRIDES += ro.fm.transmitter="false"
# RIL
PRODUCT_PROPERTY_OVERRIDES += persist.radio.apm_sim_not_pwdn="1"
PRODUCT_PROPERTY_OVERRIDES += rild.libpath="/vendor/lib/libril-qc-qmi-1.so"
PRODUCT_PROPERTY_OVERRIDES += persist.rild.nitz_plmn=""
PRODUCT_PROPERTY_OVERRIDES += persist.rild.nitz_long_ons_0=""
PRODUCT_PROPERTY_OVERRIDES += persist.rild.nitz_long_ons_1=""
PRODUCT_PROPERTY_OVERRIDES += persist.rild.nitz_long_ons_2=""
PRODUCT_PROPERTY_OVERRIDES += persist.rild.nitz_long_ons_3=""
PRODUCT_PROPERTY_OVERRIDES += persist.rild.nitz_short_ons_0=""
PRODUCT_PROPERTY_OVERRIDES += persist.rild.nitz_short_ons_1=""
PRODUCT_PROPERTY_OVERRIDES += persist.rild.nitz_short_ons_2=""
PRODUCT_PROPERTY_OVERRIDES += persist.rild.nitz_short_ons_3=""
PRODUCT_PROPERTY_OVERRIDES += ril.subscription.types="NV,RUIM"
PRODUCT_PROPERTY_OVERRIDES += DEVICE_PROVISIONED="1"
PRODUCT_PROPERTY_OVERRIDES += persist.radio.msgtunnel.start="false"
PRODUCT_PROPERTY_OVERRIDES += persist.radio.atfwd.start="true"
PRODUCT_PROPERTY_OVERRIDES += telephony.lteOnCdmaDevice="0"
PRODUCT_PROPERTY_OVERRIDES += persist.radio.rat_on="legacy"
PRODUCT_PROPERTY_OVERRIDES += gsm.isNoServiceOnFstSub="false"
PRODUCT_PROPERTY_OVERRIDES += gsm.isNoServiceOnSecSub="false"
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.call_ring.multiple="false"
# Media
PRODUCT_PROPERTY_OVERRIDES += media.stagefright.enable-player="true"
PRODUCT_PROPERTY_OVERRIDES += media.stagefright.enable-http="true"
PRODUCT_PROPERTY_OVERRIDES += media.stagefright.enable-aac="true"
PRODUCT_PROPERTY_OVERRIDES += media.stagefright.enable-qcp="true"
PRODUCT_PROPERTY_OVERRIDES += media.stagefright.enable-fma2dp="true"
PRODUCT_PROPERTY_OVERRIDES += media.stagefright.enable-scan="true"
PRODUCT_PROPERTY_OVERRIDES += mmp.enable.3g2="true"
PRODUCT_PROPERTY_OVERRIDES += media.aac_51_output_enabled="true"
PRODUCT_PROPERTY_OVERRIDES += mm.enable.qcom_parser="37491"
# WiFi
PRODUCT_PROPERTY_OVERRIDES += wifi.interface="wlan0"
