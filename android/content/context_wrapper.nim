import jnim
import android/content/context
import android/content/res/resources


jclass android.content.ContextWrapper* of Context:
    proc getResources*(): Resources
