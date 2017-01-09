DEFINE VARIABLE v-handle AS HANDLE      NO-UNDO.

DEFINE TEMP-TABLE tName REFERENCE-ONLY  
    FIELD ttempname AS CHARACTER LABEL 'Name' FORMAT "X(30)"
    FIELD ttempadd AS CHARACTER LABEL 'Address' FORMAT "X(30)".



RUN 'D:\niranjan\Block 1\030\4called.p' PERSISTENT SET v-handle.
RUN p-proc1 IN v-handle.
RUN p-proc2 IN v-handle (OUTPUT TABLE tName BIND).


FIND FIRST tname.
MESSAGE ttempname ttempadd
    VIEW-AS ALERT-BOX INFO BUTTONS OK.

DELETE PROCEDURE v-handle NO-ERROR.
