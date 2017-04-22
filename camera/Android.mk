ifneq ($(TARGET_NEEDS_CAMERA_WRAPPER),false)
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    CameraWrapper.cpp

LOCAL_C_INCLUDES := \
    system/media/camera/include

LOCAL_SHARED_LIBRARIES := \
    libhardware liblog libcamera_client libgui libutils

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := camera.qcom
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
endif

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    hw_camera.c

LOCAL_SHARED_LIBRARIES := \
    liblog libcutils libgui libbinder libutils

LOCAL_MODULE := libcam
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)
