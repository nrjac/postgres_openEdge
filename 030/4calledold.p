DEFINE TEMP-TABLE tPerson
 FIELD cname AS CHARACTER
 FIELD caddress AS CHARACTER.

PROCEDURE p-assign:

CREATE tPerson.
  ASSIGN 
      cname = 'Niranjan'.
      caddress = 'Pokhara'.
END PROCEDURE.

PROCEDURE p-call:
    DEFINE OUTPUT PARAMETER TABLE FOR tPerson BIND.
END PROCEDURE.
