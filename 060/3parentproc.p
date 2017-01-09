RUN "D:\niranjan\Block 1\060\childproc.p" (INPUT THIS-PROCEDURE).
PROCEDURE p-internal:
DEFINE INPUT PARAMETER cString AS CHARACTER NO-UNDO.
MESSAGE "The child sent the parent " cString VIEW-AS ALERT-BOX.
END PROCEDURE.


