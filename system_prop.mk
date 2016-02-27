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
# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += debug.sf.fb_always_on="1"
PRODUCT_PROPERTY_OVERRIDES += debug.egl.hw="1"
PRODUCT_PROPERTY_OVERRIDES += debug.sf.hw="1"
PRODUCT_PROPERTY_OVERRIDES += debug.composition.type="dyn"
PRODUCT_PROPERTY_OVERRIDES += persist.hwc.mdpcomp.enable="true"
PRODUCT_PROPERTY_OVERRIDES += debug.mdpcomp.logs="0"
PRODUCT_PROPERTY_OVERRIDES += debug.enabletr="0"
# QCOM
PRODUCT_PROPERTY_OVERRIDES += com.qc.hardware="true"
# Media
PRODUCT_PROPERTY_OVERRIDES += lpa.decode="true"
PRODUCT_PROPERTY_OVERRIDES += qcom.hw.aac.encoder="true"
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density="240"
# HWC
PRODUCT_PROPERTY_OVERRIDES += persist.hwc.mdpcomp.enable="true"
# OffLoad
PRODUCT_PROPERTY_OVERRIDES += av.offload.enable="false"
PRODUCT_PROPERTY_OVERRIDES += av.streaming.offload.enable="false"
# Smooth Streaming
PRODUCT_PROPERTY_OVERRIDES += mm.enable.smoothstreaming="true"
# Audio
PRODUCT_PROPERTY_OVERRIDES += audio.offload.24bit.enable="false"
PRODUCT_PROPERTY_OVERRIDES += audio.offload.buffer.size.kb="32"
PRODUCT_PROPERTY_OVERRIDES += audio.offload.gapless.enabled="false"
PRODUCT_PROPERTY_OVERRIDES += audio.offload.multiple.enabled="false"
PRODUCT_PROPERTY_OVERRIDES += audio.offload.pcm.enable="true"
# RIL
PRODUCT_PROPERTY_OVERRIDES += ro.vendor.extension_library="/vendor/lib/libqc-opt.so"
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
