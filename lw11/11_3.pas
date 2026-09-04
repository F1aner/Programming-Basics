PROGRAM WithoutLast(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(Ch);
      IF NOT EOLN
      THEN
        WRITE(Ch);
    END;
  WRITELN
END.
