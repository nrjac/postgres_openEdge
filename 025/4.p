/* find first*/
FIND FIRST Customer WHERE NAME BEGINS 'N' NO-LOCK. 
DISPLAY NAME.
/* find next*/
DO :
    FIND NEXT Customer WHERE NAME BEGINS 'N' NO-LOCK. 
    DISPLAY NAME.
END.
/* find previous*/
DO :
    FIND PREV Customer WHERE NAME BEGINS 'N' NO-LOCK. 
    DISPLAY NAME.
END.
/* find last*/
DO :
    FIND LAST Customer WHERE NAME BEGINS 'N' NO-LOCK. 
    DISPLAY NAME.
END.


