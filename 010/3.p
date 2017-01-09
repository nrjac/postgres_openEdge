FOR EACH Customer WHERE CustNum MOD 2 = 0 NO-LOCK,
    EACH order OF customer NO-LOCK:
    DISP Customer.CustNum Order.OrderNum.
END.

   
