DEF TEMP-TABLE ttable
    FIELD tstate LIKE state.state
    FIELD tstatename LIKE state.state
    FIELD tregion LIKE state.region.
DEFINE TEMP-TABLE tref  REFERENCE-ONLY
    FIELD rstate LIKE state.state
    FIELD rstatename LIKE state.statename
    FIELD rregion LIKE state.region.
FOR EACH state:
    CREATE ttable.
    ASSIGN
       tstate = state.state
       tstatename = state.statename
       tregion = state.region.
END.
RUN passtbyref(INPUT TABLE ttable BY-REFERENCE).
PROCEDURE passtbyref:
    DEFINE INPUT PARAMETER table FOR tref.
        FOR EACH tref WHERE tref.rregion = "central".
            DISPLAY rstate rstatename rregion.
        END.
END PROCEDURE.

