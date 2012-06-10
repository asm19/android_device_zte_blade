#
# Copyright (C) 2011 The Android Open-Source Project
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
USE_CAMERA_STUB := true

# Use the non-open-source parts, if they're present
-include vendor/zte/blade/BoardConfigVendor.mk

# CPU
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6-vfp

# Target and board properties
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_PROVIDES_LIBRIL := true
TARGET_BOARD_PLATFORM := msm7x27
TARGET_BOOTLOADER_BOARD_NAME := blade
TARGET_SPECIFIC_HEADER_PATH := device/zte/blade/include

# Recovery
BOARD_CUSTOM_GRAPHICS := ../../../device/zte/blade/recovery/graphics.c
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/zte/blade/recovery/recovery_ui.c
TARGET_RECOVERY_INITRC := device/zte/blade/recovery/recovery.rc

# Kernel
TARGET_KERNEL_SOURCE := kernel/zte/zte-kernel-msm7x27
TARGET_KERNEL_CONFIG := cyanogen_blade_defconfig
TARGET_PREBUILT_RECOVERY_KERNEL := device/zte/blade/recovery_kernel
BOARD_KERNEL_BASE := 0x02600000
BOARD_KERNEL_CMDLINE := androidboot.hardware=blade console=null

# WiFi
BOARD_WPA_SUPPLICANT_DRIVER := AR6000
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := wlan0
WIFI_DRIVER_MODULE_PATH     := /system/wifi/ar6000.ko
WIFI_DRIVER_MODULE_NAME     := ar6000

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# GPS
BOARD_GPS_LIBRARIES := libloc
BOARD_USES_GPSSHIM := true
BOARD_GPS_NEEDS_XTRA := true

# USB mounting
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

# Browser
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome

# QCOM
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# Graphics
TARGET_USES_GENLOCK := true
BOARD_EGL_CFG := device/zte/blade/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
TARGET_FORCE_CPU_UPLOAD := true

# dev:    size   erasesize  name
# mtd0: 00500000 00020000 "recovery"
# mtd1: 00500000 00020000 "boot"
# mtd2: 00180000 00020000 "splash"
# mtd3: 00080000 00020000 "misc"
# mtd4: 00200000 00020000 "cache"
# mtd5: 08a00000 00020000 "system"
# mtd6: 13ba0000 00020000 "userdata"
# mtd7: 00020000 00020000 "oem"
# mtd8: 00180000 00020000 "persist"
BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x0d200000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x13ba0000
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/zte/blade/releasetools/ota_from_target_files
