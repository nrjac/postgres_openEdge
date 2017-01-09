DEFINE QUERY q-CustOrd FOR Customer .

OPEN QUERY q-CustOrd FOR EACH Customer WHERE creditlimit>2000 AND NAME MATCHES '*all'.

GET FIRST q-CustOrd.

DO WHILE NOT QUERY-OFF-END('q-CustOrd'):
MESSAGE NAME custnum creditlimit.


GET NEXT q-CustOrd.
END.



