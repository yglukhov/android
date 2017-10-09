import jnim
import android.content.content_resolver

jclassDef android.provider.Settings* of JVMObject

jclassDef android.provider.Settings$NameValueTable* of JVMObject

jclass android.provider.Settings$System* of NameValueTable:
    proc getString*(resolver: ContentResolver, name: string): string {.`static`.}

jclass android.provider.Settings$Secure* of NameValueTable:
    proc getString*(resolver: ContentResolver, name: string): string {.`static`.}
