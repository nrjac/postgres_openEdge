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
    FIELD NAME AS CHARACTER LABEL "name"
  FIELD country AS CHARACTER  LABEL "country"
  FIELD address AS CHARACTER  LABEL "Address"
 FIELD phone AS CHARACTER LABEL "phone".

CREATE X-DOCUMENT hDoc.
CREATE X-NODEREF hRoot.
CREATE X-NODEREF hTable.
CREATE X-NODEREF hField.
CREATE X-NODEREF hText.

hBuf = BUFFER customer:HANDLE.

hDoc:LOAD("file", "D:\niranjan\Block 1\095\customer.xml", FALSE).
hDoc:GET-DOCUMENT-ELEMENT(hRoot).
/*read each xuser from the root*/
REPEAT i = 1 TO hRoot:NUM-CHILDREN:
  hRoot:GET-CHILD(hTable,i).
  CREATE customer.
  /*get the fields given as attributes*/
  custnum = STRING (hTable:GET-ATTRIBUTE("custnum")).
  NAME = STRING(hTable:GET-ATTRIBUTE("Name")).
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


FOR EACH customer:
DISPLAY customer WITH WIDTH 150.
END.
