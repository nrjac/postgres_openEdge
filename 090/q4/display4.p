
/*------------------------------------------------------------------------
    File        : getCustomerName.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : Niraj
    Created     : Tue Jun 23 12:30:18 NPT 2015
    Notes       :
  ----------------------------------------------------------------------*/
  
def var sportsServer  as handle no-undo.
def var connectString as char   no-undo.
def var conn          as log    no-undo.

def var customerNum   as int    no-undo.
def var customerName  as char   no-undo.

def var customerBal   as int    no-undo.

def var choice   as int    no-undo.
def var customerW   as int    no-undo.
def var customerNumber   as int    no-undo.
DEFINE VARIABLE v-num AS CHARACTER   NO-UNDO.
DEFINE VARIABLE vin AS CHARACTER   NO-UNDO.
DEFINE VARIABLE customerOp  AS INTEGER     NO-UNDO.

DEFINE VARIABLE vw AS CHARACTER   NO-UNDO.
SET v-num.



/* -DirectConnect -S 3049 -H localhost */
assign 
  connectString = '-H localhost -S 3041 -DirectConnect'.
    
create server sportsServer. /* create app server object */

conn = sportsServer:connect (connectString).

message "Connection with Sports app : " conn view-as alert-box. 
         
if conn then 

do:
    SET vin.
    choice   = integer(vin).
    run service/returnCustomerdata.p on server sportsServer (input choice , output customerW , output customerBal  ).
    CASE v-num:
        WHEN "1" THEN
        DO:
            message "Customer Balance: " customerBal
    view-as alert-box.
        END.
        WHEN "3" THEN
        DO: IF customerBal > 1000 THEN
            DO:
                message "Balance left : " customerBal
    view-as alert-box.
            END.
            ELSE 
                DO:
                message "Money cant be withdrawn for"   
      skip
    "Customer Balance: " customerBal + customerW
    view-as alert-box.
            END.
           
        END.
        WHEN "2" THEN
        DO:
            IF customerW > 0 THEN
            DO:
                message "Withdraw allow : " customerW
    view-as alert-box.
            END.
            ELSE 
                DO:
                message "Money cant be withdrawn for"   
      skip
    "Customer Number: " customerNumber
    view-as alert-box.
            END.

            
        END.

            
    END CASE.
  /* message "Customer Number: " customerNum    
      skip
    "Customer Balance: " customerBal
    view-as alert-box. */
  
  sportsServer:disconnect ().
          
end.

delete object sportsServer. 


