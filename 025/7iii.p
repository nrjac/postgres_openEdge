FOR EACH customer NO-LOCK:
   IF (CAN-FIND(FIRST order OF customer WHERE customer.creditlimit >0)) THEN
       DISPLAY NAME creditlimit WITH WIDTH 400.
        
END.
