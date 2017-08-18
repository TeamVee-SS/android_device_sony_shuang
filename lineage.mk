#
# Copyright (C) 2016 The CyanogenMod Project
#           (C) 2017 The LineageOS Project
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
#

# Inherit common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configurations
$(call inherit-product, device/sony/shuang/device.mk)

# Device display
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Device identifications
PRODUCT_DEVICE := shuang
PRODUCT_NAME := lineage_shuang
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := sony
PRODUCT_MODEL := Xperia E1
