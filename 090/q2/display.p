
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
DEFINE VARIABLE v-num AS CHARACTER   NO-UNDO.
SET v-num.



/* -DirectConnect -S 3049 -H localhost */
assign 
  connectString = '-AppService appserver_demo -S 5162 -H localhost'.
    
create server sportsServer. /* create app server object */

conn = sportsServer:connect (connectString).

message "Connection with Sports app : " conn view-as alert-box. 

if conn then 
do:
    CASE v-num:
        WHEN "1" THEN
        DO:
            DEFINE VARIABLE vin AS CHARACTER   NO-UNDO.
            SET vin.
            customerNumber   = integer(vin).
            run service/returnBalance.p on server sportsServer (input customerNumber , output customerBal ).
            message "Customer Number: " customerNumber   
      skip
    "Customer Balance: " customerBal
    view-as alert-box.
        END.
            
    END CASE.
  /* message "Customer Number: " customerNum    
      skip
    "Customer Balance: " customerBal
    view-as alert-box. */
  
  sportsServer:disconnect ().
          
end.

delete object sportsServer. 


