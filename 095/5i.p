DEFINE VARIABLE hDoc   AS HANDLE.
DEFINE VARIABLE hRoot  AS HANDLE.
DEFINE VARIABLE hTable AS HANDLE.
DEFINE VARIABLE hField AS HANDLE.
DEFINE VARIABLE hText  AS HANDLE.
DEFINE VARIABLE hBuf   AS HANDLE.
DEFINE VARIABLE hDBFld AS HANDLE.
DEFINE VARIABLE i AS INTEGER.
DEFINE VARIABLE j AS INTEGER.

DEFINE TEMP-TABLE customer
  FIELD custnum AS CHARACTER
    FIELD Name AS CHARACTER
  FIELD country AS CHARACTER  LABEL "country"
  FIELD address AS CHARACTER  LABEL "Address"
 FIELD phoneno AS CHARACTER LABEL "phoneno".

CREATE X-DOCUMENT hDoc.
CREATE X-NODEREF hRoot.
CREATE X-NODEREF hTable.
CREATE X-NODEREF hField.
CREATE X-NODEREF hText.

hBuf = BUFFER customer:HANDLE.

hDoc:LOAD("file", "D:\sarad\block 1\xml\1\customer.xml", FALSE).
hDoc:GET-DOCUMENT-ELEMENT(hRoot).
/*read each xuser from the root*/
REPEAT i = 1 TO hRoot:NUM-CHILDREN:
  hRoot:GET-CHILD(hTable,i).
  CREATE customer.
  /*get the fields given as attributes*/
    Name =  hTable:GET-ATTRIBUTE("Name").
  custnum = STRING (hTable:GET-ATTRIBUTE("custnum")).

  /*get the remaining fields given as elements with text*/
  REPEAT j = 1 TO hTable:NUM-CHILDREN:
    hTable:GET-CHILD(hField,j).    
    /*skip any null value*/
    
    hDBFld = hBuf:BUFFER-FIELD(hField:NAME).
   
    hField:GET-CHILD(hText,1).
    /*get the text value of the field*/
    hDBFld:BUFFER-VALUE = hTEXT:NODE-VALUE.
  END.
END.

DELETE OBJECT hDoc.
DELETE OBJECT hRoot.
DELETE OBJECT hTable.
DELETE OBJECT hField.
DELETE OBJECT hText.


TEMP-TABLE customer:WRITE-JSON("file", "D:\sarad\block 1\xml\5\customer1.json", TRUE).

