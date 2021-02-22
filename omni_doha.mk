#
# Copyright (C) 2020 - 2021 Doritos™ Motorola | Developers
# Copyright (C) 2019 - 2021 Team Win Recovery Project
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
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# A/B
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    vendor \
    vbmeta

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_verifier \
    update_engine_sideload

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_PACKAGES += \
    bootctrl.trinket

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.trinket \
    libcutils \
    libgptutils \
    libz

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := doha
PRODUCT_NAME := omni_doha
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G8 Plus
PRODUCT_MANUFACTURER := motorola
