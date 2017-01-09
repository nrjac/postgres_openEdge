FOR EACH Customer NO-LOCK:
    DISPLAY custnum NAME balance.
    RUN p-discount(balance).
END.

PROCEDURE p-discount:
    DEFINE INPUT  PARAMETER bal  AS INT NO-UNDO.
    DEFINE VARIABLE dis AS INT NO-UNDO LABEL "Discount Amount".
    dis = (10 * bal) / 100.
    DISPLAY dis.
END PROCEDURE



