#
# Copyright (C) 2012 The CyanogenMod Project
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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
-include device/samsung/smdk4412-common/BoardCommonConfig.mk

# Wifi
WIFI_DRIVER_MODULE_PATH :=

# Headers
TARGET_SPECIFIC_HEADER_PATH += device/samsung/n80xx-common/include

#Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/n80xx-common/bluetooth

# Bionic
MALLOC_SVELTE := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
LIBART_IMG_BASE := 0x30000000

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := xmm6262
BOARD_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING
BOARD_RIL_CLASS := ../../../device/samsung/n80xx-common/ril

# Graphics
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true

# Filesystem
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1444888576
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12620578816
BOARD_CACHEIMAGE_PARTITION_SIZE := 825638912
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_FLASH_BLOCK_SIZE := 2048
TARGET_RECOVERY_DEVICE_DIRS += device/samsung/n80xx

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  WITH_DEXPREOPT := true
endif

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/n80xx-common/rootdir/fstab.n80xx
TARGET_RECOVERY_DENSITY := mdpi
TARGET_USERIMAGES_USE_F2FS := true
RECOVERY_FSTAB_VERSION := 2

# PowerHAL
TARGET_POWERHAL_VARIANT := pegasusq

# Selinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/n80xx-common/selinux

# inherit from the proprietary version
-include vendor/samsung/n80xx-common/BoardConfigVendor.mk