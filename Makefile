TARGET := iphone:clang:13.3.1
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Dragspring
Dragspring_FILES = Tweak.xm
Dragspring_LIBRARIES = colorpicker
ARCHS = arm64 arm64e

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
