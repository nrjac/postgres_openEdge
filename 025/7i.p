DEFINE BUFFER b-customer FOR customer.
FOR EACH Customer:
    find FIRST b-customer where b-customer.NAME = Customer.NAME NO-LOCK.
	if avail(b-customer) then
	    DISPLAY b-customer.NAME.
END.
