
import jnim

jclass android.view.KeyCharacterMap* of JVMObject:
    proc load*(deviceId: jint): KeyCharacterMap {.`static`.}
    proc get*(keyCode, metaState: jint): jint
