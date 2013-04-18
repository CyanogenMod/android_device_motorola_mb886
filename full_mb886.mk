$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, device/motorola/mb886/device_mb886.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mb886
PRODUCT_NAME := full_mb886
PRODUCT_BRAND := motorola
PRODUCT_MODEL := MB886
PRODUCT_MANUFACTURER := motorola
