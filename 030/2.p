DEFINE QUERY q-CustOrd FOR Customer, Order.
DEFINE VARIABLE tc AS CHARACTER   NO-UNDO.
tc=" ".
OPEN QUERY q-CustOrd FOR EACH Customer WHERE Customer.salesrep = 'DKP' , 
    EACH Order OF Customer WHERE Order.ordernum GE 1 BY customer.NAME.

GET FIRST q-CustOrd.

DO WHILE NOT QUERY-OFF-END('q-CustOrd'):
IF NOT(tc = Customer.NAME OR tc=" ") THEN
MESSAGE Customer.NAME Customer.salesrep .
tc= Customer.NAME.
GET NEXT q-CustOrd.
END.



