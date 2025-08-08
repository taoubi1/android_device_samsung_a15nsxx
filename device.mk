#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
$(call soong_config_set,android_hardware_audio,run_64bit,true)
PRODUCT_PACKAGES += \
    android.hardware.audio@7.0-impl:64 \
    android.hardware.audio.effect@7.0-impl:64 \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio-impl:64 \
    android.hardware.soundtrigger@2.3-impl:64

PRODUCT_PACKAGES += \
    audio.primary.default:64 \
    audio.bluetooth.default:64 \
    audio.r_submix.default:64 \
    audio.usb.default:64

PRODUCT_PACKAGES += \
    audio_policy.stub:64 \
    libopus.vendor:64 \
    audioclient-types-aidl-cpp.vendor:64 \
    libaudioroute.vendor:64 \
    libaudiofoundation.vendor:64 \
    libbundlewrapper:64 \
    libbluetooth_audio_session:64 \
    libaudiopreprocessing:64 \
    libalsautils:64 \
    libdownmix:64 \
    libeffectproxy:64 \
    libnbaio_mono:64 \
    libtinycompress:64 \
    libdynproc:64 \
    libhapticgenerator:64 \
    libldnhncr:64 \
    libreverbwrapper:64 \
    libprocessgroup.vendor:64

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 34

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.3-service \
    android.hardware.memtrack-service.mediatek-mali \
    android.hardware.graphics.allocator@4.0.vendor:64 \
    android.hardware.graphics.mapper@4.0.vendor:64 \
    libhwc2on1adapter:64 \
    libhwc2onfbadapter:64

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# Keymaster
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.keystore.app_attest_key.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.keystore.app_attest_key.xml

# Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-V1-ndk_platform.vendor:64 \
    android.hardware.security.secureclock-V1-ndk_platform.vendor:64 \
    android.hardware.security.sharedsecret-V1-ndk_platform.vendor:64 \
    android.hardware.security.rkp-V3-ndk.vendor:64

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/samsung/a15nsxx/a15nsxx-vendor.mk)
