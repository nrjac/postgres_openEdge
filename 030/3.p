
/* uses a temp-table to build a summary report of invoices by customer. */
DEFINE TEMP-TABLE ttInvoice
FIELD oOrderNum LIKE order.OrderNum 
FIELD oSalesRep LIKE order.SalesRep
FIELD cCustNum LIKE Customer.CustNum 
FIELD cName LIKE Customer.Name.


/* Retrieve each order along with its Customer record, to get the Name. */
FOR EACH order, Customer OF order WHERE customer.SalesRep = 'DKP':
   FIND FIRST ttInvoice WHERE ttInvoice.cCustNum = order.CustNum NO-LOCK NO-ERROR.
   IF NOT AVAILABLE ttInvoice THEN
   DO:
     CREATE ttInvoice.
     ASSIGN ttInvoice.oOrderNum = order.OrderNum
         ttInvoice.cCustNum = Customer.CustNum 
         ttInvoice.cName = Customer.Name
         ttInvoice.oSalesRep = order.SalesRep.
        END.

  
END. /* END FOR EACH order & Customer */

/* Now display the results in descending order by order total. */
FOR EACH ttInvoice BY cName DESC:
DISPLAY cName cCustNum oSalesRep oOrderNum.
END.
