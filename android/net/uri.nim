import jnim, java.lang

jclass android.net.Uri* of JVMObject:
    proc getPath*(): String
    proc getHost*(): String
    proc getScheme*(): String
    proc toString*(): String
    