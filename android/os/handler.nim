import jnim
import jnim/java/lang

jclass android.os.Handler* of JVMObject:
    proc new*()
    proc postDelayed*(r: Runnable, delayMillis: jlong): bool
