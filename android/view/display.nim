import jnim
import android/util/display_metrics

jclass android.view.Display* of JVMObject:
    proc getMetrics*(outMetrics: DisplayMetrics)
