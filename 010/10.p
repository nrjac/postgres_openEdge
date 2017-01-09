DEFINE VARIABLE v-userinput AS CHARACTER NO-UNDO LABEL 'Value'.

DISPLAY "Input 1 for circle" SKIP.
DISPLAY "Input 2 for square" SKIP.
DISPLAY "Input 3 for rectangle" SKIP.

UPDATE v-userinput.

CASE v-userinput:
    WHEN '1'THEN
          RUN p-circle.
    WHEN '2' THEN
          RUN p-square.
    WHEN '3' THEN
          RUN p-rectangle.
    OTHERWISE
        DISPLAY "Please enter the correct value".
END CASE.

PROCEDURE p-circle:
    DEFINE VARIABLE v-r AS CHARACTER NO-UNDO LABEL 'Radius'.
    DEFINE VARIABLE v-a AS DECIMAL   NO-UNDO LABEL 'Area'.
    DISPLAY "Enter the value of radius".
    SET v-r.

    v-a = INTEGER(v-r) * INTEGER(v-r) * 2 * 3.14.
DISPLAY v-a.
END PROCEDURE.

PROCEDURE p-square:
    DEFINE VARIABLE v-l AS CHARACTER NO-UNDO LABEL 'length'.
    DEFINE VARIABLE v-a AS DECIMAL   NO-UNDO LABEL 'Area'.
    DISPLAY "Enter the length of square".
    SET v-l.

    v-a = INTEGER(v-l) * INTEGER(v-l).
DISPLAY v-a.
END PROCEDURE.

PROCEDURE p-rectangle:
    DEFINE VARIABLE v-l AS CHARACTER NO-UNDO LABEL 'Length'.
    DEFINE VARIABLE v-b AS CHARACTER NO-UNDO LABEL 'Breadth'.
    DEFINE VARIABLE v-a AS DECIMAL   NO-UNDO LABEL 'Area'.
    DISPLAY "Enter the length of rectangle".
    DISPLAY "Enter the breadth of rectangle".
    SET v-l.
    SET v-b.

    v-a = INTEGER(v-l) * INTEGER(v-b).
DISPLAY v-a.
END PROCEDURE.
