DEFINE VARIABLE hUseful AS HANDLE NO-UNDO.
    RUN 'D:\niranjan\Block 1\060\persistnt.p' PERSISTENT SET hUseful.

DEFINE VARIABLE hProc AS HANDLE NO-UNDO.
DEFINE VARIABLE v AS CHARACTER   NO-UNDO INIT 'goog'.
    hProc = SESSION:FIRST-PROCEDURE.
DO WHILE VALID-HANDLE(hProc):
    MESSAGE hProc:INTERNAL-ENTRIES "..." hProc:GET-SIGNATURE('UsefulRoutine2')
        VIEW-AS ALERT-BOX INFO BUTTONS OK.
    hProc = hProc:NEXT-SIBLING.
    END.
DELETE PROCEDURE hUseful.
