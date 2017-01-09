DEFINE NEW SHARED BUFFER x-cust FOR Customer.

DEFINE NEW SHARED QUERY  q-cust FOR x-cust.

 


DEFINE QUERY x-cust FOR Customer, invoice.
OPEN QUERY x-cust FOR EACH Customer NO-LOCK, 
    EACH invoice OF Customer NO-LOCK OUTER-JOIN.

GET FIRST x-cust.
REPEAT:
    IF NOT AVAIL customer THEN
        LEAVE.
    DISP customer.custnum NAME invoice.invoicenum invoice.invoicedate amount.
    GET NEXT x-cust.
END.
CLOSE QUERY x-cust.






  OPEN QUERY q-cust FOR EACH x-cust NO-LOCK BY x-cust.name.

 

  RUN r-query.p.



 

