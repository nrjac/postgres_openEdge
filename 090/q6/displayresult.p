
/*------------------------------------------------------------------------
    File        : getCustomerName.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Jun 23 12:30:18 NPT 2015
    Notes       :
  ----------------------------------------------------------------------*/
  
def var sportsServer  as handle no-undo.
def var connectString as char   no-undo.
def var conn          as log    no-undo.

def var customerNum   as int    no-undo.
def var customerName  as char   no-undo.

def var customerBal   as int    no-undo.
def var customerNumber   as int    no-undo.


/* -DirectConnect -S 3049 -H localhost */
assign 
  connectString = '-AppService appserver_demo -S 5162 -H localhost'
  customerNumber   = 10
  .
    
create server sportsServer. /* create app server object */

conn = sportsServer:connect (connectString).

message "Connection with Sports app : " conn view-as alert-box. 

if conn then 
do:
  run service/returnCustomer.p on server sportsServer (input customerNumber , output customerName , output customerNum, output customerBal ).
  message "Customer Number: " customerNum    
    skip 
    "Customer Name: " customerName
    "Customer Name: " customerNum
    "Customer Name: " customerBal
    view-as alert-box.
  
  sportsServer:disconnect ().
          
end.

delete object sportsServer. 


