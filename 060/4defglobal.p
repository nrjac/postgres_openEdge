DEFINE NEW SHARED VARIABLE v-cnt AS INTEGER NO-UNDO.
v-cnt = v-cnt + 1.
MESSAGE v-cnt
    VIEW-AS ALERT-BOX INFO BUTTONS OK.
