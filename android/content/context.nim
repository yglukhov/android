import jnim

jclass android.content.Context* of JVMObject:
    proc INPUT_METHOD_SERVICE*: string {.prop, `static`, final.}
    proc getSystemService*(name: string): JVMObject
