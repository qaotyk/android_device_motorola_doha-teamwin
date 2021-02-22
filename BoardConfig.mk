#
# Copyright (C) 2020 - 2021 Doritos™ Motorola | Developers
# Copyright (C) 2019 - 2021 LineageOS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/motorola/doha

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := trinket
TARGET_BOARD_PLATFORM := trinket
TARGET_NO_BOOTLOADER := true

# Partition - Size
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_FLASH_BLOCK_SIZE :=
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE :=
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE :=
BOARD_USERDATAIMAGE_PARTITION_SIZE :=

# Partition - Types
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Kernel
BOARD_KERNEL_CMDLINE := \
	console=ttyMSM0,115200,n8 \
	androidboot.hardware=qcom  \
	androidboot.console=ttyMSM0 \
	androidboot.memcg=1 \
	lpm_levels.sleep_disabled=1 \
	video=vfb:640x400,bpp=32,memsize=3072000 \
	msm_rtb.filter=0x237 \
	service_locator.enable=1 \
	swiotlb=1 \
	earlycon=msm_geni_serial,0x4a90000 \
	loop.max_part=7 \
	cgroup.memory=nokmem,nosocket \
	androidboot.usbcontroller=4e00000.dwc3 \
	printk.devkmsg=on \
	androidboot.hab.csv=10 \
	androidboot.hab.product=doha \
	androidboot.hab.cid=50 \
	firmware_class.path=/vendor/firmware_mnt/image \
	androidboot.fastboot=1 \
	androidboot.selinux=permissive

BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000

BOARD_MKBOOTIMG_ARGS += \
	--kernel_offset $(BOARD_KERNEL_OFFSET) \
	--ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
	--tags_offset $(BOARD_KERNEL_TAGS_OFFSET) \
	--header_version $(BOARD_BOOTIMG_HEADER_VERSION)

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/motorola/trinket
TARGET_KERNEL_CONFIG := doha_defconfig

