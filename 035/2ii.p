
/*xml file as below using prodataset, its attributes and methods*/
DEFINE VARIABLE cTargetType     AS CHARACTER NO-UNDO.
DEFINE VARIABLE cFile           AS CHARACTER NO-UNDO.
DEFINE VARIABLE lFormatted      AS LOGICAL   NO-UNDO.
DEFINE VARIABLE cEncoding       AS CHARACTER NO-UNDO.
DEFINE VARIABLE cSchemaLocation AS CHARACTER NO-UNDO.
DEFINE VARIABLE lWriteSchema    AS LOGICAL   NO-UNDO.
DEFINE VARIABLE lMinSchema      AS LOGICAL   NO-UNDO.
DEFINE VARIABLE lRetOK          AS LOGICAL   NO-UNDO. 

DEFINE TEMP-TABLE ttDept NO-UNDO LIKE Department.
DEFINE TEMP-TABLE ttEmployee    NO-UNDO LIKE Employee.
DEFINE TEMP-TABLE ttVacation    NO-UNDO LIKE Vacation.

DEFINE VARIABLE v-depCode AS INTEGER     NO-UNDO.
DEFINE VARIABLE v-Vac AS INTEGER   NO-UNDO.

UPDATE v-depCode.
UPDATE v-Vac.



DEFINE DATASET DSET FOR ttDept, ttEmployee , ttVacation 
       DATA-RELATION empdep FOR ttDept,     
          ttEmployee RELATION-FIELDS(DeptCode,DeptCode) NESTED
       DATA-RELATION empvac FOR ttEmployee,     
          ttVacation RELATION-FIELDS(EmpNum,EmpNum) NESTED.

DEFINE DATA-SOURCE dsDept FOR Department.
DEFINE DATA-SOURCE dsEmployee  FOR Employee.
DEFINE DATA-SOURCE dsVacation  FOR Vacation.

BUFFER ttDept:HANDLE:ATTACH-DATA-SOURCE(DATA-SOURCE dsDept:HANDLE).
BUFFER ttEmployee:HANDLE:ATTACH-DATA-SOURCE(DATA-SOURCE dsEmployee:HANDLE). 
BUFFER ttVacation:HANDLE:ATTACH-DATA-SOURCE(DATA-SOURCE dsVacation:HANDLE). 


DATA-SOURCE dsDept:FILL-WHERE-STRING = "WHERE Department.DeptCode = " + quoter(v-depCode).

IF v-vac = 0 THEN
DATA-SOURCE dsVacation:FILL-WHERE-STRING = "where 1 = 2".

DATASET DSET:FILL(). 



ASSIGN  cTargetType     = "file"  
        cFile           = "D:\Sanjay\Block1\035_Prodataset\dset1.xml"   
        lFormatted      = TRUE  
        cEncoding       = ?  
        cSchemaLocation = ?  
        lWriteSchema    = FALSE  
        lMinSchema      = FALSE. 

lRetOK = DATASET DSET:WRITE-XML(cTargetType, cFile, lFormatted, cEncoding,  cSchemaLocation, lWriteSchema, lMinSchema).

