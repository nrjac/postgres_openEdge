DEFINE VARIABLE vs AS CHARACTER   NO-UNDO.
FOR EACH Customer NO-LOCK:  
    IF vs = '' OR LOOKUP(state,vs)= 0 THEN
    DO:
        DISPLAY country.
        vs=vs + ',' + country.
    END.
END.
