GO_EASY_ON_ME=1
SYSROOT=/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.3.sdk

include theos/makefiles/common.mk

TWEAK_NAME = SMSSignuture
SMSSignuture_FILES = Tweak.xm
SMSSignuture_FRAMEWORKS=Foundation UIKit
include $(THEOS_MAKE_PATH)/tweak.mk
