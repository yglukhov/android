import jnim

jclass android.os.BaseBundle* of JVMObject:
    proc clear*()
    proc containsKey*(key: string): bool
    proc isEmpty*(): bool
    
    proc getString*(key: string): string

    proc putBoolean*(key: string, val: bool)
    proc putDouble*(key: string, val: jdouble)
    proc putInt*(key: string, val: int)
    proc putLong*(key: string, val: jlong)
    proc putString*(key: string, val: string)
    
     