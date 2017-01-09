DEFINE TEMP-TABLE tt-customer LIKE customer.
FOR EACH customer NO-LOCK:
    CREATE tt-customer.
    BUFFER-COPY customer TO tt-customer.
END.
TEMP-TABLE tt-customer:WRITE-JSON("file","D:\niranjan\Block 1\095\tt-customer.json",TRUE).
