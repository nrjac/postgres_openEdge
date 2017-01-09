DEFINE VARIABLE v-userinput AS CHARACTER NO-UNDO LABEL 'Value'.

DISPLAY "Input 1 for count" SKIP.
DISPLAY "Input 2 for total" SKIP.

UPDATE v-userinput.

CASE v-userinput:
    WHEN '1'THEN
          RUN p-count.
    WHEN '2' THEN
          RUN p-total.
    OTHERWISE
        DISPLAY "Please enter the correct value".
END CASE.

PROCEDURE p-count:
    DEFINE BUFFER b-customer FOR customer.
    
        FOR EACH customer NO-LOCK BREAK BY country :
            IF(FIRST-OF (customer.country))THEN
            DO:
           
                FOR EACH b-customer WHERE b-customer.country = customer.country:
                    DISPLAY b-customer.country b-customer.NAME b-customer.contact(COUNT) WITH WIDTH 600.
                END.

     END.
  
END.
END PROCEDURE.

PROCEDURE p-total:
    DEFINE BUFFER b_customer FOR customer.
FOR EACH customer  NO-LOCK BREAK BY customer.country:
    IF (FIRST-OF (customer.country)) THEN
    DO:
    
        FOR EACH b_customer WHERE b_customer.country = customer.country:
           ACCUMULATE  b_customer.creditlimit(TOTAL).
            DISPLAY b_customer.country b_customer.NAME b_customer.contact(COUNT) b_customer.creditlimit(TOTAL)  WITH WIDTH 80.
            END.
             IF  (ACCUM TOTAL b_customer.creditlimit) >150000 THEN
                  DO:
                      MESSAGE (ACCUM TOTAL b_customer.creditlimit)
                VIEW-AS ALERT-BOX INFO BUTTONS OK.
                  END.
            


    END.
    
   
END.
END PROCEDURE.
