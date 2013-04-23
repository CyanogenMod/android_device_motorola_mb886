TARGET_USES_MOTOROLA_COMMON_LIBLIGHT:=true
TARGET_USES_MOTOROLA_COMMON_IDC:=true
TARGET_USES_MOTOROLA_COMMON_KEYCHARS:=true
TARGET_USES_MOTOROLA_COMMON_KEYLAYOUT:=true

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, device/motorola/msm8960-common/msm8960.mk)

LOCAL_PATH := device/motorola/mb886

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# mb886 specific overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_LOCALES := en_US
PRODUCT_LOCALES += xhdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

# graphics, xda thread 2243812, suggested by Codex01
PRODUCT_PROPERTY_OVERRIDES += \
	video.accelerate.hw=1 \
	windowsmgr.max_events_per_sec=150

# ril, xda thread 2243812, suggested by Codex01
PRODUCT_PROPERTY_OVERRIDES += \
	ro.ril.hsxpa=3 \
	ro.ril.gprsclass=12 \
	ro.ril.hep=1 \
	ro.ril.enable.dtm=1 \
	ro.ril.hsdpa.category=28 \
	ro.ril.enable.a53=1 \
	ro.ril.enable.3g.prefix=1 \
	ro.ril.htcmaskw1.bitmask=4294967295 \
	ro.ril.htcmaskw1=14449 \
	ro.ril.hsupa.category=9 \
	ro.ril.disable.power.collapse=1

# power management, xda thread 2243812, suggested by Codex01
PRODUCT_PROPERTY_OVERRIDES += \
	pm.sleep_mode=1

#telephony
PRODUCT_PROPERTY_OVERRIDES += \
	telephony.lteOnGsmDevice=1 \
	ro.telephony.ril.v3=signalstrength

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/config/gps.conf:system/etc/gps.conf

$(call inherit-product-if-exists, vendor/motorola/mb886/mb886-vendor.mk)
