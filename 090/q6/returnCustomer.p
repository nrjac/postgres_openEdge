
/*------------------------------------------------------------------------
    File        : findCustomerByNum.p
    Purpose     : 

    Syntax      :

    Description : service @get customer by number

    Author(s)   : av
    Created     : Tue Jun 23 11:00:28 NPT 2015
    Notes       :
  ----------------------------------------------------------------------*/
  
def input  param customerNumber as int no-undo.
def output param customerName as char no-undo.
def output param customerNum as INT no-undo.
def output param customerBal AS DECIMAL no-undo.

find first customer where customer.custnum = customerNumber no-lock no-error.
if avail customer then 
    ASSIGN 
   customerName = customer.NAME
    customerNum = customer.custnum
   customerBal = customer.balance.
else
    assign
    customerName = ?
    customerNum = ?
    customerBal = ?.
 
