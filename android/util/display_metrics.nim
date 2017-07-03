import jnim

jclass android.util.DisplayMetrics* of JVMObject:
    proc new*
    proc density*: jfloat {.prop.}
