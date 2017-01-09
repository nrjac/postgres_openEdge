FUNCTION f-demo RETURNS INT (INPUT p-cnt AS INTEGER ).
    ASSIGN p-cnt = p-cnt + 3.
    RETURN (p-cnt + 5).
END FUNCTION.

