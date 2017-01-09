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
DEF BUFFER it FOR ITEM.
hXDoc:CREATE-NODE (hRootNode, "items", "ELEMENT").
hXDoc:APPEND-CHILD (hRootNode).
DEFINE VARIABLE a AS INTEGER     NO-UNDO.

  hXDoc:CREATE-NODE (hRow, "item", "ELEMENT").
  hRootNode:APPEND-CHILD (hRow).
  hRow:SET-ATTRIBUTE ("caption", "item category distributiom").
   hRow:SET-ATTRIBUTE ("decimalPrecision", STRING(0)).
    hRow:SET-ATTRIBUTE ("Show category", STRING(1)).
     hRow:SET-ATTRIBUTE ("Show values", STRING(1)).
     FOR EACH ITEM WHERE BREAK BY category2:
         IF( FIRST-OF (ITEM.category2))THEN
         DO:
         FOR EACH it WHERE it.category2 = ITEM.category2:
         ACCUMULATE it.minqty(TOTAL).
         ACCUMULATE it.category2(COUNT).
         END.
  hXDoc:CREATE-NODE (hField, "set", "ELEMENT").
  hrow:APPEND-CHILD (hField).
  hField:SET-ATTRIBUTE ("category", ITEM.category2).
   hField:SET-ATTRIBUTE ("totalqty", STRING(ACCUM TOTAL it.minqty)).
    hField:SET-ATTRIBUTE ("Repeated", STRING(ACCUM COUNT it.category2)).
         END.
  
  
END.
  hXDoc:SAVE ("FILE", "D:\niranjan\Block 1\095\item.xml").
  
DELETE OBJECT hXDoc.
DELETE OBJECT hRootNode.
DELETE OBJECT hRow.
DELETE OBJECT hField.
DELETE OBJECT hText.
