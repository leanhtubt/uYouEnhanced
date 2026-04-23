TARGET := iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = YouTube

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ShareFix

ShareFix_FILES = Tweak.xm
ShareFix_CFLAGS = -fobjc-arc

ShareFix_INSTALL_PATH = /var/jb/Library/MobileSubstrate/DynamicLibraries

include $(THEOS_MAKE_PATH)/tweak.mk
