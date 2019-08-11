import jnim
import android/view/[view, surface_holder]

jclass android.view.SurfaceView* of View:
    proc getHolder*(): SurfaceHolder
