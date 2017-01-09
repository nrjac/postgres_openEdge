DEFINE VARIABLE v-reg AS CHARACTER   NO-UNDO FORMAT "X(30)".
FOR EACH State NO-LOCK:
    RUN p-region(INPUT region , OUTPUT v-reg).
    DISPLAY state statename v-reg.
END.

PROCEDURE p-region:
    DEFINE INPUT  PARAMETER reg AS CHAR NO-UNDO.
    DEFINE OUTPUT PARAMETER vreg AS CHAR NO-UNDO LABEL "Discount Amount".
    IF reg = "West" THEN vreg = "It lies in western Region".
    ELSE IF reg = "East" THEN vreg = "It lies in Eastern Region".
    ELSE IF reg = "Central" THEN vreg = "It lies in Central Region".
    ELSE vreg = "It lies in Other Region".


END PROCEDURE



