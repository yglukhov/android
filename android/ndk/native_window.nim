import jnim
import rect

type
    ANativeWindow* = ptr object

    ANativeWindowBuffer* = object
        width*: int32
        height*: int32
        stride*: int32
        format*: int32
        bits*: pointer
        reserved: array[6, uint32]

    ANativeWindowFormat* {.size: sizeof(int32).} = enum
        WINDOW_FORMAT_RGBA_8888 = 1
        WINDOW_FORMAT_RGBX_8888 = 2
        WINDOW_FORMAT_RGB_565 = 4

proc setBuffersGeometry*(window: ANativeWindow, width, height: int32, format: ANativeWindowFormat): int32 {.importc: "ANativeWindow_setBuffersGeometry".}

proc getWidth*(window: ANativeWindow): int32 {.importc: "ANativeWindow_getWidth".}
proc getHeight*(window: ANativeWindow): int32 {.importc: "ANativeWindow_getHeight".}
proc getFormat*(window: ANativeWindow): ANativeWindowFormat {.importc: "ANativeWindow_getFormat".}

proc lock*(window: ANativeWindow, outBuffer: var ANativeWindowBuffer, inOutDirtyBounds: ptr ARect): int32 {.importc: "ANativeWindow_lock".}
proc unlockAndPost*(window: ANativeWindow): int32 {.importc: "ANativeWindow_unlockAndPost".}

proc acquire*(window: ANativeWindow) {.importc: "ANativeWindow_acquire".}
proc release*(window: ANativeWindow) {.importc: "ANativeWindow_release".}

proc ANativeWindow_fromSurface*(env: ptr JNIEnv, surface: jobject): ANativeWindow {.importc.}
