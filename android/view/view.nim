
import jnim
jclass android.view.View* of JVMObject:
    proc setFocusable*(focusable: bool)
    proc requestFocus*(): bool

    proc getLeft*(): jint
    proc getRight*(): jint
    proc getTop*(): jint
    proc getBottom*(): jint

    proc getWidth*(): jint
    proc getHeight*(): jint
