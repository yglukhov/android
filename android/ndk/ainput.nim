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

    AKeyEventAction* {.size: sizeof(int32).} = enum
        AKEY_EVENT_ACTION_DOWN
        AKEY_EVENT_ACTION_UP
        AKEY_EVENT_ACTION_MULTIPLE

# AInputQueue
proc attachLooper*(queue: AInputQueue, looper: ALooper, ident: cint, callback: ALooper_callbackFunc, data: pointer) {.importc: "AInputQueue_attachLooper".}
proc detachLooper*(queue: AInputQueue) {.importc: "AInputQueue_detachLooper".}
proc hasEvents*(queue: AInputQueue): int32 {.importc: "AInputQueue_hasEvents".}
proc getEvent*(queue: AInputQueue, event: var AInputEvent): int32 {.importc: "AInputQueue_getEvent".}
proc preDispatchEvent*(queue: AInputQueue, event: AInputEvent): int32 {.importc: "AInputQueue_preDispatchEvent".}
proc finishEvent*(queue: AInputQueue, event: AInputEvent, handled: cint): int32 {.importc: "AInputQueue_finishEvent".}

# AInputEvent
proc getType*(e: AInputEvent): InputEventType {.importc: "AInputEvent_getType".}

proc toMotionEvent*(e: AInputEvent): AMotionEvent =
    if e.getType() == AINPUT_EVENT_TYPE_MOTION:
        result = cast[AMotionEvent](e)

proc toKeyEvent*(e: AInputEvent): AKeyEvent =
    if e.getType() == AINPUT_EVENT_TYPE_KEY:
        result = cast[AKeyEvent](e)

proc getDeviceId*(e: AInputEvent): int32 {.importc: "AInputEvent_getDeviceId".}
proc getSource*(e: AInputEvent): int32 {.importc: "AInputEvent_getSource".}

# AKeyEvent
proc getAction*(e: AKeyEvent): AKeyEventAction {.importc: "AKeyEvent_getAction".}
proc getFlags*(e: AKeyEvent): int32 {.importc: "AKeyEvent_getFlags".}
proc getKeyCode*(e: AKeyEvent): int32 {.importc: "AKeyEvent_getKeyCode".}
proc getScanCode*(e: AKeyEvent): int32 {.importc: "AKeyEvent_getScanCode".}
proc getMetaState*(e: AKeyEvent): int32 {.importc: "AKeyEvent_getMetaState".}
proc getRepeatCount*(e: AKeyEvent): int32 {.importc: "AKeyEvent_getRepeatCount".}
proc getDownTime*(e: AKeyEvent): int64 {.importc: "AKeyEvent_getDownTime".}
proc getEventTime*(e: AKeyEvent): int64 {.importc: "AKeyEvent_getEventTime".}

# AMotionEvent
proc getAction*(e: AMotionEvent): int32 {.importc: "AMotionEvent_getAction".}
proc getX*(e: AMotionEvent, pointer_index: csize): cfloat {.importc: "AMotionEvent_getX".}
proc getY*(e: AMotionEvent, pointer_index: csize): cfloat {.importc: "AMotionEvent_getY".}
proc getRawX*(e: AMotionEvent, pointer_index: csize): cfloat {.importc: "AMotionEvent_getRawX".}
proc getRawY*(e: AMotionEvent, pointer_index: csize): cfloat {.importc: "AMotionEvent_getRawY".}
