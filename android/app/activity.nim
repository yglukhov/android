import jnim
import android / content / [ context, intent ]
import android.app.application
import android.view.window_manager

jclass java.lang.Runnable* of JVMObject:
    proc run*()

jclass android.app.Activity* of Context:
    proc runOnUiThread*(r: Runnable)
    proc getIntent*(): Intent
    proc getApplication*(): Application
    proc getWindowManager*(): WindowManager
