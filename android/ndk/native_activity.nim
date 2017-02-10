import jnim

import asset_manager

type ANativeActivity* = ptr object
    callbacks*: pointer # TODO: defined this
    vm*: ptr JavaVM
    env*: ptr JNIEnv
    obj*: jobject # activity instance
    internalDataPath*: cstring
    externalDataPath*: cstring
    sdkVersion*: int32
    instance*: pointer
    assetManager*: AAssetManager
    obbPath*: cstring

proc finish*(activity: ANativeActivity) {.importc: "ANativeActivity_finish".}
proc setWindowFormat*(activity: ANativeActivity, format: int32) {.importc: "ANativeActivity_setWindowFormat".}
proc setWindowFlags*(activity: ANativeActivity, addFlags, removeFlags: uint32) {.importc: "ANativeActivity_setWindowFlags".}
proc showSoftInput*(activity: ANativeActivity, flags: uint32) {.importc: "ANativeActivity_showSoftInput".}
proc hideSoftInput*(activity: ANativeActivity, flags: uint32) {.importc: "ANativeActivity_hideSoftInput".}
