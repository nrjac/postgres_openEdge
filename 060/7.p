DEF VAR v-num AS INTEGER NO-UNDO.
FUNCTION f-check RETURNS INT (INPUT p-cnt AS INTEGER ) FORWARD.
DO v-num = 1 TO 3.
  MESSAGE f-check(v-num) VIEW-AS ALERT-BOX .
END.
FUNCTION f-check RETURN INT (INPUT p-cnt AS INTEGER ).
    ASSIGN p-cnt = p-cnt * p-cnt .
    RETURN (p-cnt).
END FUNCTION.
