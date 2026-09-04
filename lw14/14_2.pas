PROGRAM RunReversCopy(INPUT, OUTPUT);
VAR 
  Ch: CHAR;
PROCEDURE ReversCopy(VAR F1, F2: TEXT);
{VAR
  Ch: CHAR;}
BEGIN {ReversCopy}
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch);
      ReversCopy(F1, F2)
    END
  ELSE
    WRITELN(OUTPUT)
END;{ReversCopy}

BEGIN{RunReversCopy}
  ReversCopy(INPUT, OUTPUT);
END.{RunReversCopy}
