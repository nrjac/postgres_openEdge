DEFINE VARIABLE hUseful AS HANDLE NO-UNDO.
    RUN 'D:\niranjan\Block 1\060\2runpersistant.p' PERSISTENT SET hUseful.

DEFINE VARIABLE hProc AS HANDLE NO-UNDO.
DEFINE VARIABLE v AS CHARACTER   NO-UNDO INIT 'goog'.
    hProc = SESSION:FIRST-PROCEDURE.
DO WHILE VALID-HANDLE(hProc):
    MESSAGE num-entries(hProc:INTERNAL-ENTRIES)
        VIEW-AS ALERT-BOX INFO BUTTONS OK.
    IF LOOKUP ("UsefulRoutine1", hProc:INTERNAL-ENTRIES) NE 0 THEN
        DO:
            RUN UsefulRoutine1 IN hProc(INPUT v).
            LEAVE.
        END.
      hProc = hProc:NEXT-SIBLING.
    END.

DELETE PROCEDURE hUseful.

