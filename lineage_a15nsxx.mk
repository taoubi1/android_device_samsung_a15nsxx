#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
AB_OTA_UPDATER := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit from device makefile.
$(call inherit-product, device/samsung/a15nsxx/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

BOARD_VENDOR := samsung
PRODUCT_NAME := lineage_a15nsxx
PRODUCT_DEVICE := a15nsxx
PRODUCT_MANUFACTURER := samsung
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A155F

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceName=a15nsxx \
    BuildFingerprint=samsung/a15nsxx/a15:12/SP1A.210812.016/A155FXXS7CYG1:user/release-keys

# Time
LINEAGE_VERSION_APPEND_TIME_OF_DAY := true
