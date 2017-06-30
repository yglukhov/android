import jnim
import android / content / [ context, intent ]

jclass java.lang.Runnable* of JVMObject:
    proc run*()

jclass android.app.Activity* of Context:
    proc runOnUiThread*(r: Runnable)
    proc getIntent*(): Intent
