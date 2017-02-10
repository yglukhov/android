type
    AInputQueue* = ptr object

    AInputEvent* = ptr input_event
    input_event {.inheritable, pure.} = object

    AMotionEvent* = ptr object of AInputEvent
    AKeyEvent* = ptr object of AInputEvent

    InputEventType* {.size: sizeof(int32).} = enum
        AINPUT_EVENT_TYPE_KEY = 1
        AINPUT_EVENT_TYPE_MOTION = 2

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
