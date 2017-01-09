DEFINE VARIABLE v-userinput AS CHARACTER NO-UNDO LABEL 'Year'.
UPDATE v-userinput.
FUNCTION leap-check RETURNS CHARACTER
(INPUT num AS INTEGER) FORWARD.
FUNCTION leap-year RETURNS CHARACTER
(INPUT num AS INTEGER):
    IF (num MOD 4) = 0 AND NOT((num MOD 100) = 0) THEN RETURN "This is a leap Year" .
    ELSE IF (num MOD 100) = 0 AND (num MOD 400) = 0 THEN RETURN "This is a leap Year".
    ELSE RETURN "This is a not leap Year".
END FUNCTION.
DISPLAY leap-year (INTEGER(v-userinput)) FORMAT "X(30)".



