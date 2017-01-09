DEFINE BUFFER b_customer FOR customer.
FOR EACH customer  NO-LOCK BREAK BY customer.country:
    IF (FIRST-OF (customer.country)) THEN
    DO:
    
        FOR EACH b_customer WHERE b_customer.country = customer.country:
            DISPLAY b_customer.country b_customer.NAME b_customer.contact(COUNT) WITH WIDTH 80.
            END.
    END.
    
   
END.

