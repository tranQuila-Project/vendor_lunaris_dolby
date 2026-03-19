#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DOLBY_PATH := vendor/lunaris/dolby

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += \
    $(DOLBY_PATH)

# Media codecs
PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/media/media_codecs_dolby_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_dolby_audio.xml

# DAX default configs
PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/proprietary/odm/etc/dolby/multimedia_dolby_dax_default.xml:$(TARGET_COPY_OUT_ODM)/etc/dolby/multimedia_dolby_dax_default.xml

# LunarisDolby app
PRODUCT_PACKAGES += \
    LunarisDolby \
    XiaomiDolbyResCommon

# Permissions
PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/configs/permissions/privapp-permissions-dolby.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-dolby.xml

# Init script
PRODUCT_PACKAGES += \
    init.dolby.rc

# ODM HAL blobs
PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/proprietary/odm/etc/init/vendor.dolby.media.c2@1.0-service.rc:$(TARGET_COPY_OUT_ODM)/etc/init/vendor.dolby.media.c2@1.0-service.rc \
    $(DOLBY_PATH)/proprietary/odm/etc/init/vendor.dolby_sp.hardware.dmssp@2.0-service.rc:$(TARGET_COPY_OUT_ODM)/etc/init/vendor.dolby_sp.hardware.dmssp@2.0-service.rc \
    $(DOLBY_PATH)/proprietary/odm/etc/init/vendor.dolby_v3_6.hardware.dms360@2.0-service.rc:$(TARGET_COPY_OUT_ODM)/etc/init/vendor.dolby_v3_6.hardware.dms360@2.0-service.rc

PRODUCT_PACKAGES += \
    libdapparamstorage_v3_6 \
    libdeccfg_v3_6 \
    libdlbdsservice_v3_6 \
    vendor.dolby_v3_6.hardware.dms360@2.0 \
    libstagefright_soft_ddpdec \
    libhwdap_v3_6 \
    libswdap_v3_6 \
    libcodec2_hidl@1.0_sp \
    libcodec2_hidl_plugin_sp \
    libcodec2_soft_ac4dec_sp \
    libcodec2_soft_common_sp \
    libcodec2_soft_ddpdec_sp \
    libcodec2_store_dolby_sp \
    libcodec2_vndk_sp \
    libdapparamstorage_sp \
    libdeccfg_sp \
    libdlbdsservice_sp \
    libui_sp \
    vendor.dolby_sp.hardware.dmssp@2.0-impl \
    vendor.dolby_sp.hardware.dmssp@2.0 \
    vendor.dolby_v3_6.hardware.dms360@2.0-impl \
    manifest_dax_dolby_v3_6.xml \
    vendor.dolby.hardware.dms.xml \
    vendor.dolby_sp.hardware.dmssp@2.0-service \
    vendor.dolby_sp.media.c2@1.0-service \
    vendor.dolby_v3_6.hardware.dms360@2.0-service

# VINTF
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DOLBY_PATH)/vintf/dolby_framework_compatibility_matrix.xml

DEVICE_MANIFEST_FILE += \
    $(DOLBY_PATH)/vintf/dolby_manifest.xml
