
/*------------------------------------------------------------------------
    File        : findCustomerByNum.p
    Purpose     : 

    Syntax      :

    Description : service @get customer by number

    Author(s)   : av
    Created     : Tue Jun 23 11:00:28 NPT 2015
    Notes       :
  ----------------------------------------------------------------------*/
  
def input  param choice as int no-undo.
DEFINE VARIABLE customerNumber  AS INTEGER     NO-UNDO.
def output param customerW as DECIMAL no-undo.
def output param customerBal as INTEGER no-undo.
DEFINE VARIABLE customerNum  AS INTEGER     NO-UNDO.
DEFINE VARIABLE vin  AS CHARACTER   NO-UNDO LABEL "CustomeNum".
DEFINE VARIABLE vnn  AS CHARACTER   NO-UNDO LABEL "CustomeWithdraw".

CASE choice:
    WHEN 1 THEN
    DO:
        SET vin.
            customerNumber   = integer(vin).
        find first customer where customer.custnum = customerNumber no-lock no-error.
if avail customer then 
    ASSIGN 
    customerBal = customer.balance.
else
    assign
    customerBal = ?.
	End.
    WHEN 2 THEN
    DO:
       SET vin.
       customerNumber   = integer(vin).
       find first customer where customer.custnum = customerNumber no-lock no-error.
if avail customer then 
    ASSIGN 
    customerW = customer.balance - 1000.
else
    assign
    customerW = ?.
    END.
    WHEN 3 THEN
    DO:
        SET vin.
       customerNumber   = integer(vin).
       SET vnn.
       customerW   = integer(vin).

        find first customer where customer.custnum = customerNumber no-lock no-error.
if avail customer then 
    ASSIGN 
    customerBal = customer.balance - customerW.
   else
    assign
    customerBal = ?.
    END.

END CASE.


 
