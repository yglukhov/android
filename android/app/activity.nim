import jnim
import android / content / [ context, intent ]
import android/app/application
import android/view/window_manager

jclass java.lang.Runnable* of JVMObject:
    proc run*()

jclass android.app.Activity* of Context:
    proc runOnUiThread*(r: Runnable)
    proc getIntent*(): Intent
    proc getApplication*(): Application
    proc getWindowManager*(): WindowManager

var gCurrentActivity {.threadvar.}: Activity

proc setCurrentActivity*(a: Activity) =
    ## This can be called by upper-level application framework.
    gCurrentActivity = a

proc getSDLMainActivity(): Activity =
    let cls = JVMClass.getByFqcn("org/libsdl/app/SDLActivity")
    if not cls.isNil:
        let meth = cls.getStaticMethodId("getContext", "()Landroid/content/Context;")
        if not cast[pointer](meth).isNil:
            let j = cls.callObjectMethodRaw(meth, [])
            if not j.isNil:
                result = Activity.fromJObject(j)

proc currentActivityIfPresent*(): Activity =
    if gCurrentActivity.isNil:
        gCurrentActivity = getSDLMainActivity()
    gCurrentActivity

proc currentActivity*(): Activity =
    result = currentActivityIfPresent()
    doAssert(not result.isNil, "Current activity was not set")
