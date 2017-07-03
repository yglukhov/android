import jnim
import android.ndk.aasset_manager

jclassDef android.content.res.AssetManager* of JVMObject

proc getNative*(am: AssetManager): AAssetManager =
    AAssetManager_fromJava(am.get())
