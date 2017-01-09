/*creates a dynamic DataSet and Data-Sources, fills it
for a key value passed in, and returns it.*/

DEFINE INPUT PARAMETER pcBuffers AS CHARACTER NO-UNDO.
DEFINE INPUT PARAMETER pcFields AS CHARACTER NO-UNDO.
DEFINE INPUT PARAMETER pcSources AS CHARACTER NO-UNDO.
DEFINE INPUT PARAMETER pcSourceKeys AS CHARACTER NO-UNDO.
DEFINE INPUT PARAMETER pcKeyValue AS CHARACTER NO-UNDO.
DEFINE OUTPUT PARAMETER DATASET-HANDLE phDataSet.
/*
The parameters provide the following information:
• pcBuffers — A list of buffer handles expressed as a comma-delimited string for
temp-tables in the caller to be included in the ProDataSet.
• pcFields — A list of fields to define the relation between the first two buffers passed in.
• pcSources — A list of database table names to use as Data-Sources for the buffers, one
for each buffer.
• pcSourceKeys — A list of key fields for the Data-Source tables, one for each Data-Source.
• pcKeyValue — A key value for the top-level table to use to fill the ProDataSet.
• phDataSet — The procedure returns the dynamic ProDataSet as an OUTPUT parameter
              using the DATASET-HANDLE form, so that the caller can inspect and use the ProDataSet.
              
*/  

DEFINE VARIABLE iEntry AS INTEGER NO-UNDO.
DEFINE VARIABLE hDataSource AS HANDLE NO-UNDO.
DEFINE VARIABLE hBuffer AS HANDLE NO-UNDO.
DEFINE VARIABLE hQuery AS HANDLE NO-UNDO.

CREATE DATASET phDataSet.
DO iEntry = 1 TO NUM-ENTRIES(pcBuffers):
phDataSet:ADD-BUFFER(WIDGET-HANDLE(ENTRY(iEntry, pcBuffers))).
END.

phDataSet:ADD-RELATION(phDataSet:GET-BUFFER-HANDLE(1),phDataSet:GET-BUFFER-HANDLE(2),pcFields).

DO iEntry = 1 TO NUM-ENTRIES(pcSources):
CREATE DATA-SOURCE hDataSource.
CREATE BUFFER hBuffer FOR TABLE ENTRY(iEntry, pcSources).
hDataSource:ADD-SOURCE-BUFFER(hBuffer, ENTRY(iEntry,pcSourceKeys)).
phDataSet:GET-BUFFER-HANDLE(iEntry):ATTACH-DATA-SOURCE(hDataSource).
IF iEntry = 1 THEN DO:
CREATE QUERY hQuery.
hQuery:ADD-BUFFER(hBuffer).
hQuery:QUERY-PREPARE("FOR EACH " + ENTRY(1, pcSources) +
" WHERE " + ENTRY(1, pcSourceKeys) +
" = " + pcKeyValue).
hDataSource:QUERY = hQuery.
END. /* END DO IF iEntry = 1 */

END.

phDataSet:FILL().
DELETE OBJECT hQuery.
DO iEntry = 1 TO phDataSet:NUM-BUFFERS:
hBuffer = phDataSet:GET-BUFFER-HANDLE(iEntry).
DELETE OBJECT hBuffer:DATA-SOURCE.
END.

