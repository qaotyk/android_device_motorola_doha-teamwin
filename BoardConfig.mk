#
# Copyright (C) 2020 - 2021 Doritos™ Motorola | Developers
# Copyright (C) 2016 - 2021 LineageOS
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

# Inherit common
-include device/motorola/sm6125-common/BoardConfigCommon.mk

# Kernel - Prebuilt
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img

# Kernel - Mkbootimg_args
BOARD_MKBOOTIMG_ARGS += \
	--second_offset $(BOARD_KERNEL_SECOND_OFFSET) \
	--dtb_offset $(BOARD_DTB_OFFSET) \
	--dtb $(TARGET_PREBUILT_DTB)

# Kernel - Offsets
BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
BOARD_DTB_OFFSET := 0x01f00000

# Partitions - Rules
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
TARGET_USES_MKE2FS := true

# Partitions - Size
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_METADATAIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3238002688
BOARD_USERDATAIMAGE_PARTITION_SIZE := 53359918592
BOARD_VBMETA_PARTITION_SIZE := 65536
BOARD_VENDORIMAGE_PARTITION_SIZE := 620756992

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Recovery Wipe
TARGET_RECOVERY_WIPE := $(DEVICE_PATH)/recovery/root/recovery.wipe

# Team Win Recovery Configuration
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_EXTRA_LANGUAGES := true
TW_HAS_EDL_MODE := true
TW_NO_SCREEN_TIMEOUT := true

TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 150
TW_Y_OFFSET := 73
TW_H_OFFSET := -73