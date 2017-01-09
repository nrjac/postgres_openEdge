
DEFINE VARIABLE cTargetType     AS CHARACTER NO-UNDO.
DEFINE VARIABLE cFile           AS CHARACTER NO-UNDO.
DEFINE VARIABLE lFormatted      AS LOGICAL   NO-UNDO.
DEFINE VARIABLE cEncoding       AS CHARACTER NO-UNDO.
DEFINE VARIABLE cSchemaLocation AS CHARACTER NO-UNDO.
DEFINE VARIABLE lWriteSchema    AS LOGICAL   NO-UNDO.
DEFINE VARIABLE lMinSchema      AS LOGICAL   NO-UNDO.
DEFINE VARIABLE lRetOK          AS LOGICAL   NO-UNDO. 

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

DATA-SOURCE dsCustomer:FILL-WHERE-STRING = "WHERE Customer.CustNum = 2 ".

DATASET DSET:FILL(). 

ASSIGN  cTargetType     = "file"  
        cFile           = "D:\niranjan\Block 1\095\dset.xml"   
        lFormatted      = TRUE  
        cEncoding       = ?  
        cSchemaLocation = ?  
        lWriteSchema    = FALSE  
        lMinSchema      = FALSE. 

lRetOK = DATASET DSET:WRITE-XML(cTargetType, cFile, lFormatted, cEncoding,  cSchemaLocation, lWriteSchema, lMinSchema).

