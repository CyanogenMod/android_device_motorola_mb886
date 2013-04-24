## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff. 
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280

# Release name
PRODUCT_RELEASE_NAME := mb886
PRODUCT_NAME := cm_mb886

$(call inherit-product, device/motorola/mb886/full_mb886.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_BRAND=motorola PRODUCT_NAME=mb886 BUILD_PRODUCT=mb886 BUILD_FINGERPRINT=motorola/mb886/qinara:4.0.4/7.7.1Q-144_VQL_S3-49/346380647:user/release-keys
