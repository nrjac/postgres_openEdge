DEFINE VARIABLE cTargetType     AS CHARACTER NO-UNDO.
DEFINE VARIABLE cFile           AS CHARACTER NO-UNDO.
DEFINE VARIABLE lFormatted      AS LOGICAL   NO-UNDO.
DEFINE VARIABLE cEncoding       AS CHARACTER NO-UNDO.
DEFINE VARIABLE cSchemaLocation AS CHARACTER NO-UNDO.
DEFINE VARIABLE lWriteSchema    AS LOGICAL   NO-UNDO.
DEFINE VARIABLE lMinSchema      AS LOGICAL   NO-UNDO.
DEFINE VARIABLE lRetOK          AS LOGICAL   NO-UNDO. 
DEFINE VARIABLE v-input AS INTEGER     NO-UNDO.
DEFINE TEMP-TABLE ttdept NO-UNDO SERIALIZE-NAME 'department' LIKE department.
DEFINE TEMP-TABLE ttemp    NO-UNDO LIKE employee.
DEFINE TEMP-TABLE ttvaction    NO-UNDO LIKE vacation.

   

DEFINE DATASET DSET FOR ttdept, ttemp,ttvaction
       DATA-RELATION deptname FOR ttdept,     
          ttemp RELATION-FIELDS(deptcode,deptcode) NESTED
    DATA-RELATION empnum FOR ttemp,
    ttvaction RELATION-FIELDS(empnum,empnum)NESTED.  
     

DEFINE DATA-SOURCE dsdept FOR department.
DEFINE DATA-SOURCE dsemp    FOR Employee.
    DEFINE DATA-SOURCE dsvac    FOR vacation.


BUFFER ttdept:HANDLE:ATTACH-DATA-SOURCE(DATA-SOURCE dsdept:HANDLE).
BUFFER ttemp:HANDLE:ATTACH-DATA-SOURCE(DATA-SOURCE dsemp:HANDLE).
BUFFER ttvaction:HANDLE:ATTACH-DATA-SOURCE(DATA-SOURCE dsvac:HANDLE).
SET v-input.

DATA-SOURCE dsdept:FILL-WHERE-STRING = "WHERE department.deptcode = " + quoter(v-input).

DATASET DSET:FILL(). 

ASSIGN  cTargetType     = "file"  
        cFile           = "D:\dset2.xml"   
        lFormatted      = TRUE  
        cEncoding       = ?  
        cSchemaLocation = ?  
        lWriteSchema    = FALSE  
        lMinSchema      = FALSE. 

lRetOK = DATASET DSET:WRITE-XML(cTargetType, cFile, lFormatted, cEncoding,  cSchemaLocation, lWriteSchema, lMinSchema).
