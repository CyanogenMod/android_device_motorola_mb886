-include device/motorola/msm8960-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/motorola/mb886/BoardConfigVendor.mk

LOCAL_PATH := device/motorola/mb886

# Use common resources
TARGET_USES_MOTOROLA_MSM8960_COMMON_LIBLIGHT := true

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/motorola/msm8960-common
TARGET_KERNEL_CONFIG := msm8960_mmi_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8960_mmi_gsm_defconfig

# copy all kernel modules under the "kerne/modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
	find $(LOCAL_PATH)/kernel/modules -name '*.ko' 2> /dev/null \
	| sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
	| tr '\n' ' ')

BOARD_KERNEL_CMDLINE := console=/dev/null androidboot.hardware=qcom user_debug=31 loglevel=1 msm_rtb.filter=0x3F kgsl.mmutype=gpummu zcache
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01600000

#bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

#TWRP
DEVICE_RESOLUTION := 720x1280
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_USB_STORAGE := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
#BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/init.recovery.rc
TARGET_USERIMAGES_USE_EXT4 := true
