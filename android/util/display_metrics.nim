import jnim

jclass android.util.DisplayMetrics* of JVMObject:
    proc new*
    proc density*: jfloat {.prop.}
    proc densityDpi*: jint {.prop.}
    proc heightPixels*: jint {.prop.}
    proc widthPixels*: jint {.prop.}
    proc scaledDensity*: jfloat {.prop.}
    proc xdpi*: jfloat {.prop.}
    proc ydpi*: jfloat {.prop.}
