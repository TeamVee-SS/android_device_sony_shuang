## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := falconss

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/sony/falconss/device_falconss.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := falconss
PRODUCT_NAME := cm_falconss
PRODUCT_BRAND := sony
PRODUCT_MODEL := falconss
PRODUCT_MANUFACTURER := sony
