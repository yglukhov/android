import jnim
import android.view.display

jclass android.view.WindowManager* of JVMObject:
    proc getDefaultDisplay*: Display
