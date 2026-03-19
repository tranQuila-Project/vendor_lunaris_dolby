#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DOLBY_PATH := vendor/lunaris/dolby

# Properties
TARGET_ODM_PROP += $(DOLBY_PATH)/properties/odm.prop

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DOLBY_PATH)/sepolicy/vendor

# Inherit from proprietary targets
include $(DOLBY_PATH)/BoardConfigVendor.mk
