    
    DEFINE BUFFER b-item FOR ITEM.
        DEFINE TEMP-TABLE ttitem
            FIELD category LIKE ITEM.category2
            FIELD minqty AS INTEGER
            FIELD tot AS INTEGER.
    FOR EACH ITEM WHERE BREAK BY category2:
         IF( FIRST-OF (ITEM.category2))THEN
         DO:
             CREATE ttitem.
         FOR EACH b-item WHERE b-item.category2 = ITEM.category2:
             
ASSIGN ttitem.cat = ITEM.category2.
ACCUMULATE b-item.minqty(TOTAL).
        ACCUMULATE b-item.category2(COUNT).
        ASSIGN ttitem.minqty = ACCUM  TOTAL b-item.minqty
            ttitem.tot = ACCUM COUNT b-item.category2.
        
         END.
         

         END.
    END.

         TEMP-TABLE ttitem:WRITE-JSON('file','D:\sarad\block 1\xml\5\customer2.json',TRUE).
