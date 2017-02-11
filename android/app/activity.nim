import jnim
import android.content.context

jclass java.lang.Runnable* of JVMObject:
    proc run*()

jclass android.app.Activity* of Context:
    proc runOnUiThread*(r: Runnable)
