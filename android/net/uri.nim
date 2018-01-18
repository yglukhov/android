import jnim

jclass android.net.Uri* of JVMObject:
    proc getPath*(): string
    proc getHost*(): string
    proc getScheme*(): string
    proc toString*(): string
    