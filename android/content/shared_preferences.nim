import jnim

jclass android.content.SharedPreferences$Editor of JVMObject:
    proc putString*(key, value: string): Editor
    proc commit*(): bool
    proc apply*()

jclass android.content.SharedPreferences* of JVMObject:
    proc edit*(): Editor
    proc getBoolean*(key: string, defValue: bool): bool
    proc getString*(key, defValue: string): string
