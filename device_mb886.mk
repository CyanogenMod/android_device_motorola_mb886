#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

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

$(call inherit-product, device/motorola/msm8960-common/idc/idc.mk)
$(call inherit-product, device/motorola/msm8960-common/keychars/keychars.mk)
$(call inherit-product, device/motorola/msm8960-common/keylayout/keylayout.mk)
$(call inherit-product-if-exists, vendor/motorola/mb886/mb886-vendor.mk)
