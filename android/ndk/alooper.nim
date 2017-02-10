type
    ALooper* = ptr object
    ALooper_callbackFunc* = proc(fd, events: cint, data: pointer): cint {.cdecl.}

const
    ALOOPER_POLL_WAKE* = cint(-1)
    ALOOPER_POLL_CALLBACK* = cint(-2)
    ALOOPER_POLL_TIMEOUT* = cint(-3)
    ALOOPER_POLL_ERROR* = cint(-4)

const
    ALOOPER_EVENT_INPUT* = cint(1 shl 0)
    ALOOPER_EVENT_OUTPUT* = cint(1 shl 1)
    ALOOPER_EVENT_ERROR* = cint(1 shl 2)
    ALOOPER_EVENT_HANGUP* = cint(1 shl 3)
    ALOOPER_EVENT_INVALID* = cint(1 shl 4) 

proc ALooper_forThread*(): ALooper {.importc.}
proc ALooper_prepare*(opts: cint): ALooper {.importc.}

proc acquire*(looper: ALooper) {.importc: "ALooper_acquire".}
proc release*(looper: ALooper) {.importc: "ALooper_release".}

proc ALooper_pollOnce*(timeoutMillis: cint, outFd, outEvents: ptr cint, outData: ptr pointer): cint {.importc.}
proc ALooper_pollAll*(timeoutMillis: cint, outFd, outEvents: ptr cint, outData: ptr pointer): cint {.importc.}

proc wake*(looper: ALooper) {.importc: "ALooper_wake".}

proc addFd*(looper: ALooper, fd, ident, events: cint, callback: ALooper_callbackFunc, data: pointer): cint {.importc: "ALooper_addFd".}
proc removeFd*(looper: ALooper, fd: cint): cint {.importc: "ALooper_removeFd".}
