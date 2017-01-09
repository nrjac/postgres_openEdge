DEFINE VARIABLE v-reg AS CHARACTER   NO-UNDO FORMAT "X(30)".
FOR EACH State NO-LOCK:
    RUN p-region(INPUT region , OUTPUT v-reg).
    DISPLAY state statename v-reg.
END.

PROCEDURE p-region:
    DEFINE INPUT  PARAMETER reg AS CHAR NO-UNDO.
    DEFINE OUTPUT PARAMETER vreg AS CHAR NO-UNDO LABEL "Discount Amount".
    CASE reg:
        WHEN "West" THEN vreg = "It lies in western Region".
        WHEN "East" THEN vreg = "It lies in Eastern Region".
        WHEN "Center" THEN vreg = "It lies in Central Region".
        OTHERWISE vreg = "It lies in Other Region".
    END CASE.
END PROCEDURE



