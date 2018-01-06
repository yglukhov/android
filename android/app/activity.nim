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

var gCurrentActivity: Activity

proc setCurrentActivity*(a: Activity) =
    ## This should be called by upper-level application framework
    gCurrentActivity = a

proc currentActivity*(): Activity =
    doAssert(not gCurrentActivity.isNil, "Current activity was not set")
    gCurrentActivity

proc currentActivityIfPresent*(): Activity = gCurrentActivity
