#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a15nsxx
CONFIGS_PATH := $(DEVICE_PATH)/configs

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := a15
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 450

# OTA assert
TARGET_OTA_ASSERT_DEVICE := a15nsxx,a15

# Platform
TARGET_BOARD_PLATFORM := mt6789

# Properties
TARGET_PRODUCT_PROP += $(CONFIGS_PATH)/properties/product.prop
TARGET_SYSTEM_PROP += $(CONFIGS_PATH)/properties/system.prop
TARGET_VENDOR_PROP += $(CONFIGS_PATH)/properties/vendor.prop

# Vendor Security Patch
VENDOR_SECURITY_PATCH := 2025-05-01

# VINTF
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
   $(CONFIGS_PATH)/vintf/device_framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE := $(CONFIGS_PATH)/vintf/manifest.xml
DEVICE_MATRIX_FILE := $(CONFIGS_PATH)/vintf/compatibility_matrix.xml

# Inherit the proprietary files
include vendor/samsung/a15nsxx/BoardConfigVendor.mk
