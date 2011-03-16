

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := sdl_mixer

LOCAL_CFLAGS := -I$(LOCAL_PATH) -I$(LOCAL_PATH)/.. -I$(LOCAL_PATH)/../sdl/include -I$(LOCAL_PATH)/../mad \
					-DWAV_MUSIC -DOGG_USE_TREMOR -DOGG_MUSIC  -DMOD_MUSIC -I$(LOCAL_PATH)/../mikmod/include

LOCAL_CPP_EXTENSION := .cpp

LOCAL_SRC_FILES := $(notdir $(wildcard $(LOCAL_PATH)/*.c))

LOCAL_SHARED_LIBRARIES := sdl
LOCAL_STATIC_LIBRARIES := tremor mikmod

ifneq ($(SDL_MIXER_USE_LIBMAD),)
	LOCAL_CFLAGS += -DMP3_MAD_MUSIC
	LOCAL_SHARED_LIBRARIES += mad
endif

include $(BUILD_SHARED_LIBRARY)