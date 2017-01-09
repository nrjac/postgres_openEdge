DEFINE VARIABLE cTargetType     AS CHARACTER NO-UNDO.
DEFINE VARIABLE cFile           AS CHARACTER NO-UNDO.
DEFINE VARIABLE lFormatted      AS LOGICAL   NO-UNDO.
DEFINE VARIABLE cEncoding       AS CHARACTER NO-UNDO.
DEFINE VARIABLE cSchemaLocation AS CHARACTER NO-UNDO.
DEFINE VARIABLE lWriteSchema    AS LOGICAL   NO-UNDO.
DEFINE VARIABLE lMinSchema      AS LOGICAL   NO-UNDO.
DEFINE VARIABLE lRetOK          AS LOGICAL   NO-UNDO. 

DEFINE TEMP-TABLE ttEmployee NO-UNDO SERIALIZE-NAME 'Employee' LIKE Employee.
DEFINE TEMP-TABLE ttDepartment    NO-UNDO SERIALIZE-NAME 'Department' LIKE Department.


DEFINE DATASET DSET FOR ttEmployee, ttDepartment  
       DATA-RELATION EmpDepart FOR ttEmployee,     
          ttDepartment RELATION-FIELDS(ttEmployee.DeptCode,ttDepartment.DeptCode) NESTED.  
 

DEFINE DATA-SOURCE dsEmployee FOR Employee.
DEFINE DATA-SOURCE dsDepartment    FOR Department.


BUFFER ttEmployee:HANDLE:ATTACH-DATA-SOURCE(DATA-SOURCE dsEmployee:HANDLE).
BUFFER ttDepartment:HANDLE:ATTACH-DATA-SOURCE(DATA-SOURCE dsDepartment:HANDLE).



DATASET DSET:FILL(). 

ASSIGN  cTargetType     = "file"  
        cFile           = "D:\niranjan\Block 1\035\dset.xml"   
        lFormatted      = TRUE  
        cEncoding       = ?  
        cSchemaLocation = ?  
        lWriteSchema    = FALSE  
        lMinSchema      = FALSE. 

lRetOK = DATASET DSET:WRITE-XML(cTargetType, cFile, lFormatted, cEncoding,  cSchemaLocation, lWriteSchema, lMinSchema).
