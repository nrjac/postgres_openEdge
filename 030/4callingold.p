DEFINE VARIABLE hProc AS HANDLE NO-UNDO.
DEFINE TEMP-TABLE tPerson  
    FIELD cName AS CHARACTER
    FIELD cAddress AS CHARACTER.

RUN "D:\niranjan\Block 1\030\4called.p" PERSISTENT SET hProc.
RUN p-assign IN hProc.

RUN p-call IN hProc (OUTPUT TABLE tPerson BIND).

FIND FIRST tPerson.
MESSAGE cName cAddress VIEW-AS ALERT-BOX INFO BUTTONS OK.