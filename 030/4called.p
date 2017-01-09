/*4.	Create a temp table with fields name and address.
 Insert your name and address. 
 Pass that temp table from one program to next program.
  Display your name, address on 2nd program. */
  
  
  DEFINE TEMP-TABLE ttName 
    FIELD ttname AS CHARACTER LABEL 'Name' FORMAT "X(30)"
    FIELD ttaddr AS CHARACTER LABEL 'Address' FORMAT "X(30)".

PROCEDURE p-proc1:
   
    CREATE ttName.
    ASSIGN
        ttname = 'Hari'
        ttaddr = 'Pokhara'.

END PROCEDURE.

PROCEDURE p-proc2:

    DEFINE OUTPUT PARAMETER TABLE FOR ttName BIND.
/*
    FIND FIRST ttName NO-LOCK NO-ERROR.
    IF AVAIL ttName THEN
        MESSAGE 'proc2: ' ttName ttaddr
            VIEW-AS ALERT-BOX INFO BUTTONS OK.
    
  */
    
END PROCEDURE.
