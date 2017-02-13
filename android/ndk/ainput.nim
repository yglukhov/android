import alooper

type
    AInputQueue* = ptr object

    AInputEvent* = ptr input_event
    input_event {.inheritable, pure.} = object

    AMotionEvent* = ptr object of AInputEvent
    AKeyEvent* = ptr object of AInputEvent

    InputEventType* {.size: sizeof(int32).} = enum
        AINPUT_EVENT_TYPE_KEY = 1
        AINPUT_EVENT_TYPE_MOTION = 2

proc attachLooper*(queue: AInputQueue, looper: ALooper, ident: cint, callback: ALooper_callbackFunc, data: pointer) {.importc: "AInputQueue_attachLooper".}
proc detachLooper*(queue: AInputQueue) {.importc: "AInputQueue_detachLooper".}
proc hasEvents*(queue: AInputQueue): int32 {.importc: "AInputQueue_hasEvents".}
proc getEvent*(queue: AInputQueue, event: var AInputEvent): int32 {.importc: "AInputQueue_getEvent".}
proc preDispatchEvent*(queue: AInputQueue, event: AInputEvent): int32 {.importc: "AInputQueue_preDispatchEvent".}
proc finishEvent*(queue: AInputQueue, event: AInputEvent, handled: cint): int32 {.importc: "AInputQueue_finishEvent".}

proc getType*(e: AInputEvent): InputEventType {.importc: "AInputEvent_getType".}

proc toMotionEvent*(e: AInputEvent): AMotionEvent =
    if e.getType() == AINPUT_EVENT_TYPE_MOTION:
        result = cast[AMotionEvent](e)

proc toKeyEvent*(e: AInputEvent): AKeyEvent =
    if e.getType() == AINPUT_EVENT_TYPE_KEY:
        result = cast[AKeyEvent](e)


proc getAction*(e: AMotionEvent): int32 {.importc: "AMotionEvent_getAction".}
proc getX*(e: AMotionEvent, pointer_index: csize): cfloat {.importc: "AMotionEvent_getX".}
proc getY*(e: AMotionEvent, pointer_index: csize): cfloat {.importc: "AMotionEvent_getY".}
proc getRawX*(e: AMotionEvent, pointer_index: csize): cfloat {.importc: "AMotionEvent_getRawX".}
proc getRawY*(e: AMotionEvent, pointer_index: csize): cfloat {.importc: "AMotionEvent_getRawY".}
