DEFINT A-Z
DECLARE SUB Comline (n, a$(), Max)
DIM a$(1 TO 15)
CALL Comline(n, a$(), 10)

IF a$(1) = "" THEN
PRINT "sleep.exe n"
GOTO konec
END IF

y = VAL(a$(1))
REM tonumber = VAL
REM PRINT "$1="; y

REM X& = long datovej typ, % = integer, ! = single, # = double
REM && = int64, ## = _FLOAT

x& = y * 60000
REM PRINT "loop = "; x&
FOR a& = 1 TO x&
s = SQR(a&)
REM PRINT s
NEXT a&

konec:

SUB Comline (NumArgs, Args$(), MaxArgs) STATIC
CONST TRUE = -1, FALSE = 0

   NumArgs = 0: In = FALSE
' Get the command line using the COMMAND$ function.
   Cl$ = COMMAND$
   L = LEN(Cl$)
' Go through the command line a character at a time.
   FOR I = 1 TO L
      C$ = MID$(Cl$, I, 1)
    'Test for character being a blank or a tab.
      IF (C$ <> " " AND C$ <> CHR$(9)) THEN
    ' Neither blank nor tab.
    ' Test to see if you're already
    ' inside an argument.
         IF NOT In THEN
      ' You've found the start of a new argument.
      ' Test for too many arguments.
            IF NumArgs = MaxArgs THEN EXIT FOR
            NumArgs = NumArgs + 1
            In = TRUE
         END IF
     ' Add the character to the current argument.
         Args$(NumArgs) = Args$(NumArgs) + C$
      ELSE
   ' Found a blank or a tab.
   ' Set "Not in an argument" flag to FALSE.
         In = FALSE
      END IF
   NEXT I

END SUB

