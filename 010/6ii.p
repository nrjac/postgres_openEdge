DEFINE VARIABLE v_date  AS CHARACTER   NO-UNDO.
v_date = "Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec".
FOR EACH order NO-LOCK:
    DISPLAY ENTRY(MONTH(shipdate),v_date).
END.
