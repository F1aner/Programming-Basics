PROGRAM CountingSymbolsInText(INPUT, OUTPUT);
USES
  Count3;
VAR
  Ch, X100, X10, X1: CHAR;
BEGIN{CountingSymbolsInText}
  Start;
  WHILE NOT EOF
  DO
    BEGIN
      WHILE NOT EOLN
      DO
        BEGIN
          READ(Ch);
          Bump;
          WRITE(Ch)
        END;
      READLN;
      WRITELN
    END;
  WRITELN;
  Value(X100, X10, X1);
  IF (X100 = '9') AND (X10 = '9') AND (X1 = '9')
  THEN
    WRITELN('Количество символов как минимум 999')
  ELSE
    WRITELN('Количество символов: ', X100, X10, X1)
END. {CountingSymbolsInText}
