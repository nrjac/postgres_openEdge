PROCEDURE UsefulRoutine1:
def input parameter v-check as char no-undo.
    MESSAGE v-check VIEW-AS ALERT-BOX.
END PROCEDURE.

PROCEDURE UsefulRoutine2:
def input parameter v-check as char no-undo.
    MESSAGE "2nd routine" v-check VIEW-AS ALERT-BOX.
END PROCEDURE.
