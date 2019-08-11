import jnim
import android/util/display_metrics

jclass android.content.res.Resources* of JVMObject:
    proc getDisplayMetrics*(): DisplayMetrics
