DEFINE VARIABLE hSAXWriter AS HANDLE.
DEFINE VARIABLE lok AS LOGICAL.
CREATE SAX-WRITER hSAXWriter.
hSAXWriter:FORMATTED = TRUE.
lok = hSAXWriter:SET-OUTPUT-DESTINATION("file", "D:\niranjan\doc\block1\095_WorkingWithXML\examples\saxwrite.xml").
lok = hSAXWriter:START-DOCUMENT().
lok = hSAXWriter:START-ELEMENT("customers").
FOR EACH customer WHERE custnum < 5:
  lok = hSAXWriter:START-ELEMENT("customer").
  lok = hSAXWriter:INSERT-ATTRIBUTE("CustNum", STRING(CustNum)).
  lok = hSAXWriter:INSERT-ATTRIBUTE("Name" , NAME).
  lok = hSAXWriter:WRITE-DATA-ELEMENT("Address", Address).
  lok = hSAXWriter:WRITE-DATA-ELEMENT("Address2", Address2).
  lok = hSAXWriter:WRITE-DATA-ELEMENT("City", City).
  lok = hSAXWriter:WRITE-DATA-ELEMENT("State", State).
  lok = hSAXWriter:WRITE-DATA-ELEMENT("PostalCode", PostalCode).
  lok = hSAXWriter:WRITE-DATA-ELEMENT("Country", Country).
  lok = hSAXWriter:WRITE-DATA-ELEMENT("Phone", Phone).
  lok = hSAXWriter:WRITE-DATA-ELEMENT("Contact", Contact).
  lok = hSAXWriter:WRITE-DATA-ELEMENT("Sales-Rep", SalesRep).
  lok = hSAXWriter:WRITE-DATA-ELEMENT("Credit-Limit",STRING(CreditLimit)).
  lok = hSAXWriter:WRITE-DATA-ELEMENT("Balance", STRING(Balance)).
  lok = hSAXWriter:WRITE-DATA-ELEMENT("Terms", Terms).
  lok = hSAXWriter:WRITE-DATA-ELEMENT("Discount", STRING(Discount)).
  lok = hSAXWriter:WRITE-DATA-ELEMENT("Comments", Comments).
  lok = hSAXWriter:END-ELEMENT("customer").
END.
lok = hSAXWriter:END-ELEMENT("customers").
lok = hSAXWriter:END-DOCUMENT().
