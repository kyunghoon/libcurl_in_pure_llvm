LOCAL_PATH:= $(call my-dir)

CFLAGS := -Wpointer-arith -Wwrite-strings -Wunused -Winline \
 -Wnested-externs -Wmissing-declarations -Wmissing-prototypes -Wno-long-long \
 -Wfloat-equal -Wno-multichar -Wsign-compare -Wno-format-nonliteral \
 -Wendif-labels -Wstrict-prototypes -Wdeclaration-after-statement \
 -Wno-system-headers -DHAVE_CONFIG_H -DBUILDING_LIBCURL

include $(CLEAR_VARS)
include $(LOCAL_PATH)/curl/lib/Makefile.inc

#CSOURCES 在 Makefile.inc中定义
LOCAL_SRC_FILES := $(addprefix curl/lib/,$(CSOURCES))
LOCAL_CFLAGS += $(CFLAGS)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/curl/include/ $(LOCAL_PATH)/curl/lib

LOCAL_COPY_HEADERS_TO := libcurl
LOCAL_COPY_HEADERS := $(addprefix curl/include/curl/,$(HHEADERS))

LOCAL_MODULE:= libcurl

# Build static library  
include $(BUILD_STATIC_LIBRARY)

# Build shared library  
#include $(BUILD_SHARED_LIBRARY)

