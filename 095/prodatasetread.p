DEFINE VARIABLE cSourceType             AS CHARACTER NO-UNDO.
DEFINE VARIABLE cReadMode               AS CHARACTER NO-UNDO.
DEFINE VARIABLE lOverrideDefaultMapping AS LOGICAL   NO-UNDO.
DEFINE VARIABLE cFile                   AS CHARACTER NO-UNDO.
DEFINE VARIABLE cSchemaLocation         AS CHARACTER NO-UNDO.
DEFINE VARIABLE cFieldTypeMapping       AS CHARACTER NO-UNDO.
DEFINE VARIABLE cVerifySchemaMode       AS CHARACTER NO-UNDO.
DEFINE VARIABLE lRetOK                  AS LOGICAL   NO-UNDO.
DEFINE VARIABLE hDSet                   AS HANDLE    NO-UNDO.

DEFINE TEMP-TABLE ttCustomer NO-UNDO LIKE Customer.
DEFINE TEMP-TABLE ttOrder    NO-UNDO LIKE Order.
DEFINE TEMP-TABLE ttInvoice  NO-UNDO LIKE Invoice. 

DEFINE DATASET DSET FOR ttCustomer, ttOrder, ttInvoice  
       DATA-RELATION CustOrd FOR ttCustomer,     
          ttOrder RELATION-FIELDS(CustNum,CustNum) NESTED  
       DATA-RELATION OrdInv FOR ttOrder,     
          ttInvoice RELATION-FIELDS(OrderNum,OrderNum) NESTED. 

           
DEFINE DATA-SOURCE dsCustomer FOR Customer.
DEFINE DATA-SOURCE dsOrder    FOR Order.

DEFINE DATA-SOURCE dsInvoice  FOR Invoice. 
BUFFER ttCustomer:HANDLE:ATTACH-DATA-SOURCE(DATA-SOURCE dsCustomer:HANDLE).
BUFFER ttOrder:HANDLE:ATTACH-DATA-SOURCE(DATA-SOURCE dsOrder:HANDLE).
BUFFER ttInvoice:HANDLE:ATTACH-DATA-SOURCE(DATA-SOURCE dsInvoice:HANDLE). 
/*
CREATE DATASET hDSet.
  */  
hdset = DATASET dset:HANDLE.

ASSIGN  cSourceType             = "file"  
        cFile                   = "D:\niranjan\Block 1\095\dset.xml"   
        cReadMode               = "empty"
        cSchemaLocation         = ?
        lOverrideDefaultMapping = ?  
        cFieldTypeMapping       = ?  
        cVerifySchemaMode       = ?. 

lRetOK = hDSet:READ-XML(cSourceType, cFile, cReadMode, cSchemaLocation,  lOverrideDefaultMapping, cFieldTypeMapping, cVerifySchemaMode).

FOR EACH ttCustomer NO-LOCK:
    DISP ttcustomer.custnum ttcustomer.NAME.
END.




