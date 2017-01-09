Define buffer b-customer for Customer.
FIND FIRST b-customer NO-LOCK.
DISPLAY b-customer.NAME b-customer.country.

FOR EACH Customer NO-LOCK BREAK BY customer.country:
    IF(FIRST-OF(customer.country)) THEN
    REPEAT:
        FIND NEXT b-customer.
        IF AVAIL(b-customer) THEN
            DISPLAY b-customer.NAME  b-customer.country.
        ELSE LEAVE.
         END.
END.

