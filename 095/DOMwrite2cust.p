
DEF VAR hXDoc     AS HANDLE.
DEF VAR hRootNode AS HANDLE.
DEF VAR hRow      AS HANDLE.
DEF VAR hField    AS HANDLE.
DEF VAR hText     AS HANDLE.

CREATE X-DOCUMENT hXDoc. 
CREATE X-NODEREF  hRootNode.
CREATE X-NODEREF  hRow.  
CREATE X-NODEREF  hField. 
CREATE X-NODEREF  hText.

hXDoc:CREATE-NODE (hRootNode, "customers", "ELEMENT").
hXDoc:APPEND-CHILD (hRootNode).

FOR EACH customer WHERE customer.custnum < 20:
  hXDoc:CREATE-NODE (hRow, "customer", "ELEMENT").
  hRootNode:APPEND-CHILD (hRow).
  hRow:SET-ATTRIBUTE ("custnum", STRING(customer.custnum)).
  hXDoc:CREATE-NODE (hField, "name", "ELEMENT").
  hRow:SET-ATTRIBUTE ("Name", STRING(customer.NAME)).
  hXDoc:CREATE-NODE (hField, "phone", "ELEMENT").
  hRow:APPEND-CHILD (hField).
  hXDoc:CREATE-NODE (hText, "", "TEXT").
  hField:APPEND-CHILD (hText).
  hText:NODE-VALUE = customer.phone.
  hXDoc:CREATE-NODE (hField, "Country", "ELEMENT").
  hRow:APPEND-CHILD (hField).
  hXDoc:CREATE-NODE (hText, "", "TEXT").
  hField:APPEND-CHILD (hText).
  hText:NODE-VALUE = customer.country.
  hXDoc:CREATE-NODE (hField, "address", "ELEMENT").
  hRow:APPEND-CHILD (hField).
  hXDoc:CREATE-NODE (hText, "", "TEXT").
  hField:APPEND-CHILD (hText).
  hText:NODE-VALUE = customer.address.
END.
  hXDoc:SAVE ("FILE", "D:\niranjan\Block 1\095\customer.xml").
  
DELETE OBJECT hXDoc.
DELETE OBJECT hRootNode.
DELETE OBJECT hRow.
DELETE OBJECT hField.
DELETE OBJECT hText.
