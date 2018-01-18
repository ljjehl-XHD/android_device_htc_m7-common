# Copyright (C) 2016 The CyanogenMod Project
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

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Audio Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-service-qti

PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.soundtrigger@2.0-impl \
    android.hardware.broadcastradio@1.0-impl \
    audio_amplifier.msm8960 \
    audio.a2dp.default \
    audio.primary.msm8960 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bcm4335_prepatch.hcd:$(TARGET_COPY_OUT_VENDOR)/firmware/bcm4335_prepatch.hcd

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    libbt-vendor

# Camera HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    camera.device@1.0-impl \
    camera.msm8960

# Charger
WITH_LINEAGE_CHARGER := false

# Display
PRODUCT_PACKAGES += \
    libhwc2on1adapter \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.memtrack@1.0-impl \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    libgenlock \
    liboverlay \
    memtrack.msm8960

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.0-service.widevine

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    gps.msm8960

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0-java

# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    $(LOCAL_PATH)/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libxml2 \
    libcnefeatureconfig

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    $(LOCAL_PATH)/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    $(LOCAL_PATH)/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl \
    $(LOCAL_PATH)/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

# Keymaster HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    keystore.msm8960

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    lights.msm8960

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libstagefrighthw

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    android.hardware.nfc@1.0-impl \
    libnfc \
    libnfc_jni \
    libnfc_ndef \
    nfc.msm8960 \
    Tag \
    Nfc

ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \
    power.msm8960

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.power.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.target.rc \
    ueventd.qcom.rc

# Renderscript
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# SDCard
PRODUCT_CHARACTERISTICS := nosdcard

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp_policy/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp_policy/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

# Shims
PRODUCT_PACKAGES += \
    libshim_atomic \
    libqc-opt_shim \
    libshim_wvm \
    liblog_shim \
    libshim_ril

# System properties & permissions
-include $(LOCAL_PATH)/system_prop.mk
-include $(LOCAL_PATH)/permissions.mk

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermald.conf:system/etc/thermald.conf

# Usb
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service \
    com.android.future.usb.accessory

# Vendor Interface Manifest
DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/manifest.xml

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    libnetcmdiface \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf \
    libwifi-hal-bcm \
    libwpa_client \
    wificond

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/calibration:system/etc/calibration \
    $(LOCAL_PATH)/configs/calibration_EMEA:system/etc/calibration_EMEA \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# Include non-opensource parts
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4335/device-bcm.mk)
$(call inherit-product-if-exists, vendor/htc/m7-common/m7-common-vendor.mk)
