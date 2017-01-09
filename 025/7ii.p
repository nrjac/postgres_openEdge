FOR EACH Customer:
    find FIRST customer where customer.NAME = Customer.NAME NO-LOCK.
	if avail(customer) then
	    DISPLAY customer.NAME.
END.
/* FIND cannot be processed for a FOR EACH mode record   */
