DEF VAR v-date AS CHAR NO-UNDO INIT '1,3,9'.
    
FOR EACH order NO-LOCK:
    IF CAN-DO(v-date,STRING(MONTH(shipdate))) THEN 
        DISPLAY "Present in the List".
    ELSE
        DISPLAY "Not in the List".
END.

