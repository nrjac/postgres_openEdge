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
