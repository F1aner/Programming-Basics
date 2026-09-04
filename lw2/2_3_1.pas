PROGRAM PrintLess(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  READ(Ch);
  WHILE (NOT EOLN)
  DO
    BEGIN
      IF Ch <> ' '
      THEN
        WRITE(Ch);
        READ(Ch)
    END;
  WRITELN('Программа без пробелов ')
END.
