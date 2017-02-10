import jnim

jclass android.view.inputmethod.InputMethodManager* of JVMObject:
    proc toggleSoftInput*(showFlags, hideFlags: jint)
