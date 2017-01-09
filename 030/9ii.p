DEFINE SHARED BUFFER b-customer FOR customer.
DEFINE SHARED BUFFER b-invoice FOR invoice.
DEFINE SHARED QUERY q-shared FOR b-customer , b-invoice.
GET FIRST q-shared.
REPEAT :
    DISPLAY b-customer.custnum b-customer.NAME b-invoice.invoicenum b-invoice.invoicedate b-invoice.amount WITH WIDTH 200.
    GET NEXT q-shared.
    END.
