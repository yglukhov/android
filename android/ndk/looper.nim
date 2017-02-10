type
    ALooper* = ptr object
    ALooper_callbackFunc* = proc(fd, events: cint, data: pointer): cint {.cdecl.}

proc ALooper_forThread*(): ALooper {.importc.}
proc ALooper_prepare*(opts: cint): ALooper {.importc.}

proc acquire*(looper: ALooper) {.importc: "ALooper_acquire".}
proc release*(looper: ALooper) {.importc: "ALooper_release".}

proc ALooper_pollOnce*(timeoutMillis: cint, outFd, outEvents: ptr cint, outData: ptr pointer): cint {.importc.}
proc ALooper_pollAll*(timeoutMillis: cint, outFd, outEvents: ptr cint, outData: ptr pointer): cint {.importc.}

proc wake*(looper: ALooper) {.importc: "ALooper_wake".}

proc addFd*(looper: ALooper, fd, ident, events: cint, callback: ALooper_callbackFunc, data: pointer): cint {.importc: "ALooper_addFd".}
proc removeFd*(looper: ALooper, fd: cint): cint {.importc: "ALooper_removeFd".}
