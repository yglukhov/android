import posix, os, strutils

proc packageName*(): string =
    result = readFile("/proc/" & $getpid() & "/cmdline")
    var i = 0
    while i < result.len:
        if not (result[i].isAlphaNumeric or result[i] == '.'):
            break
        inc i
    result.setLen(i)

proc appDataDir*(): string {.inline.} = "/data/data/" & packageName()

proc appFilesDir*(): string =
    var f {.global.}: string
    if f.isNil:
        f = appDataDir() & "/files"
    result = f

proc appPreferencesDir*(): string =
    appDataDir() & "/shared_prefs"
