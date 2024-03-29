GO_EASY_ON_ME=1
#TARGET = simulator:clang:11.0
#TARGET = macosx
TARGET = iphone:clang::11.0
#export SDKVERSION=11.2
#export ARCHS= arm64
#export ARCHS=x86_64 
export ARCHS= arm64 arm64e
include $(THEOS)/makefiles/common.mk
#THEOS_DEVICE_IP=guest-room.local
THEOS_DEVICE_IP= xphone
TOOL_NAME = classdump-dyld
classdump-dyld_FILES = main.mm
classdump-dyld_FRAMEWORKS = CoreFoundation Foundation
classdump-dyld_CFLAGS = -stdlib=libc++
#classdump-dyld_LDFLAGS = -Wl,-segalign,0x4000 -undefined dynamic_lookup
classdump-dyld_CODESIGN_FLAGS = -Sent.plist
include $(THEOS)/makefiles/tool.mk
include $(THEOS)/makefiles/library.mk
SUBPROJECTS += classdumpdyldlib
include $(THEOS_MAKE_PATH)/aggregate.mk
