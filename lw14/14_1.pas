PROGRAM RunReversCopy(INPUT, OUTPUT);
PROCEDURE ReversCopy(VAR F1, F2: TEXT);
VAR
  Ch: CHAR;
BEGIN {ReversCopy}
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch);
      ReversCopy(F1, F2);
      WRITE(F2, Ch)
    END
END;{ReversCopy}

BEGIN{RunReversCopy}
  ReversCopy(INPUT, OUTPUT);
  WRITELN(OUTPUT)
END.{RunReversCopy}
