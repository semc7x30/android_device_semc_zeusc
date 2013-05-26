# proprietary side of the device
$(call inherit-product-if-exists, vendor/semc/zeusc/zeusc-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/semc/zeusc/overlay

$(call inherit-product, device/semc/zeus-common/zeus.mk)

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

PRODUCT_AAPT_CONFIG := normal hdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.semc.usb.rc:root/init.semc.usb.rc \
    $(LOCAL_PATH)/rootdir/init.recovery.semc.rc:root/init.recovery.semc.rc \
    $(LOCAL_PATH)/rootdir/system/etc/hw_config.sh:system/etc/hw_config.sh

# Device specific configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/usr/idc/cy8ctma300_touch.idc:system/usr/idc/cy8ctma300_touch.idc \
    $(LOCAL_PATH)/rootdir/system/usr/idc/synaptics_touchpad.idc:system/usr/idc/synaptics_touchpad.idc \
    $(LOCAL_PATH)/rootdir/system/usr/keychars/keypad-game-zeus.kcm:system/usr/keychars/keypad-game-zeus.kcm \
    $(LOCAL_PATH)/rootdir/system/usr/keychars/keypad-zeus.kcm:system/usr/keychars/keypad-zeus.kcm \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/atdaemon.kl:system/usr/keylayout/atdaemon.kl \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/keypad-game-zeus.kl:system/usr/keylayout/keypad-game-zeus.kl \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/keypad-phone-zeus.kl:system/usr/keylayout/keypad-phone-zeus.kl \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/keypad-zeus.kl:system/usr/keylayout/keypad-zeus.kl \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/simple_remote.kl:system/usr/keylayout/simple_remote.kl \
    $(LOCAL_PATH)/rootdir/system/etc/sensors.conf:system/etc/sensors.conf

# Device properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    ro.telephony.ril_class=SemcQualcomm7x30RILCDMA \
    ro.telephony.default_network=4 \
    ro.ril.vzw.feature=1 \
    ro.ril.wp.feature=1 \
    persist.telephony.support_ipv4=true \
    persist.telephony.support_ipv6=true \
    ro.cdma.data_retry_config=max_retries=infinite,0,0,60000,120000,480000,900000 \
    ro.cdma.home.operator.alpha=Verizon \
    ro.cdma.home.operator.numeric=310012 \
    ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
    ro.telephony.ril.v3=datacall
