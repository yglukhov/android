import jnim
import java.lang
import android.os.bundle
import android.net.uri

jclass android.content.Intent* of JVMObject:
    proc getExtras*(): Bundle
    proc getData*(): Uri
    proc hasExtra*(key: string): bool
    proc getStringExtra*(key: string): String
