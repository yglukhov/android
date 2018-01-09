import jnim
import android / content / [ context, shared_preferences ]

jclass android.preference.PreferenceManager* of JVMObject:
    proc getDefaultSharedPreferences*(context: Context): SharedPreferences {.`static`.}
