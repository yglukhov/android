import jnim
import android.content.content_resolver
import android.content.res.asset_manager

jclass android.content.Context* of JVMObject:
    proc INPUT_METHOD_SERVICE*: string {.prop, `static`, final.}
    proc getSystemService*(name: string): JVMObject
    proc getAssets*: AssetManager
    proc getContentResolver*: ContentResolver
