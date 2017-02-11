import jnim

import aasset_manager, anative_window, ainput, arect

type
    ANativeActivity* = ptr object
        callbacks*: ptr ANativeActivityCallbacks
        vm*: ptr JavaVM
        env*: ptr JNIEnv
        obj*: jobject # activity instance
        internalDataPath*: cstring
        externalDataPath*: cstring
        sdkVersion*: int32
        instance*: pointer
        assetManager*: AAssetManager
        obbPath*: cstring

    ANativeActivityCallbacks* = object
        onStart*: proc(activity: ANativeActivity) {.cdecl.}
        onResume*: proc(activity: ANativeActivity) {.cdecl.}
        onSaveInstanceState*: proc(activity: ANativeActivity, outSize: var csize): pointer {.cdecl.}
        onPause*: proc(activity: ANativeActivity) {.cdecl.}
        onStop*: proc(activity: ANativeActivity) {.cdecl.}
        onDestroy*: proc(activity: ANativeActivity) {.cdecl.}
        onWindowFocusChanged*: proc(activity: ANativeActivity, hasFocus: cint) {.cdecl.}
        onNativeWindowCreated*: proc(activity: ANativeActivity, window: ANativeWindow) {.cdecl.}
        onNativeWindowResized*: proc(activity: ANativeActivity, window: ANativeWindow) {.cdecl.}
        onNativeWindowRedrawNeeded*: proc(activity: ANativeActivity, window: ANativeWindow) {.cdecl.}
        onNativeWindowDestroyed*: proc(activity: ANativeActivity, window: ANativeWindow) {.cdecl.}
        onInputQueueCreated*: proc(activity: ANativeActivity, queue: AInputQueue) {.cdecl.}
        onInputQueueDestroyed*: proc(activity: ANativeActivity, queue: AInputQueue) {.cdecl.}
        onContentRectChanged*: proc(activity: ANativeActivity, rect: ptr ARect) {.cdecl.}
        onConfigurationChanged*: proc(activity: ANativeActivity) {.cdecl.}
        onLowMemory*: proc(activity: ANativeActivity) {.cdecl.}

proc finish*(activity: ANativeActivity) {.importc: "ANativeActivity_finish".}
proc setWindowFormat*(activity: ANativeActivity, format: int32) {.importc: "ANativeActivity_setWindowFormat".}
proc setWindowFlags*(activity: ANativeActivity, addFlags, removeFlags: uint32) {.importc: "ANativeActivity_setWindowFlags".}
proc showSoftInput*(activity: ANativeActivity, flags: uint32) {.importc: "ANativeActivity_showSoftInput".}
proc hideSoftInput*(activity: ANativeActivity, flags: uint32) {.importc: "ANativeActivity_hideSoftInput".}
