DEFINE NEW SHARED BUFFER b-customer FOR customer.
DEFINE NEW SHARED BUFFER b-invoice FOR invoice.
DEFINE NEW SHARED QUERY q-shared FOR b-customer , b-invoice.
    OPEN QUERY q-shared FOR EACH b-customer , 
    EACH b-invoice OF b-customer NO-LOCK BY b-customer.NAME.
RUN 'D:\niranjan\Block 1\030\9ii.p'.
