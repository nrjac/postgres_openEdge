define variable v-temp as character.
  
DEFINE QUERY q-query FOR 
    customer FIELDS(customer.NAME customer.emailaddress),
    order FIELDS (order.ordernum order.orderdate order.orderstatus),
    orderline FIELDS(orderline.linenum orderline.price orderline.qty).

    OPEN QUERY q-query FOR EACH customer,
        EACH order OF customer,
        EACH orderline OF order NO-LOCK.
          REPEAT:
          GET  NEXT q-query.
         
        IF customer.NAME = ENTRY(1,SESSION:PARAM) THEN
        DO:
            v-temp =  ENTRY(2,SESSION:PARAM).
            OUTPUT TO VALUE(v-temp).
            DISPLAY customer.name customer.emailaddress order.ordernum order.orderdate order.orderstatus orderline.qty orderline.linenum orderline.price WITH WIDTH 300.
           OUTPUT CLOSE.
            END.
        END.


    

