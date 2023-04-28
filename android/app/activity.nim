import jnim
import jnim/java/lang # for Runnable
import android / content / [ context_wrapper, intent ]
import android/app/application
import android/view/window_manager
import android/os/bundle

jclass android.app.Activity* of ContextWrapper:
    proc runOnUiThread*(r: Runnable)
    proc getIntent*(): Intent
    proc getApplication*(): Application
    proc getWindowManager*(): WindowManager
    proc onCreate*(savedInstanceState: Bundle)

var gCurrentActivity {.threadvar.}: Activity

proc setCurrentActivity*(a: Activity) =
    ## This can be called by upper-level application framework.
    gCurrentActivity = a

proc getSDLMainActivity(): Activity =
    let cls = JVMClass.getByFqcn("org/libsdl/app/SDLActivity")
    if not cls.isNil:
        let j = cls.callMethod(jobject, "getContext", "()Landroid/content/Context;")
        if not j.isNil:
            result = Activity.fromJObject(j)

proc currentActivityIfPresent*(): Activity =
    if gCurrentActivity.isNil:
        gCurrentActivity = getSDLMainActivity()
    gCurrentActivity

proc currentActivity*(): Activity =
    result = currentActivityIfPresent()
    doAssert(not result.isNil, "Current activity was not set")
