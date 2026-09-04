PROGRAM CountingBlanksInText(INPUT, OUTPUT);
VAR
  Ch: CHAR;
  Counter: INTEGER;
BEGIN {CountingBlanksInText}
  Counter := 0; {обнулить счетчик}
  WHILE NOT EOF
  DO
    BEGIN
      WHILE NOT EOLN
      DO
        BEGIN
          READ(Ch);
          IF Ch = ' '
          THEN {Увеличиваем счетчик на единицу}
            Counter := Counter +1;
          WRITE(Ch);
        END;
        READLN;
        WRITELN
    END;
  WRITELN;
  IF Counter >= 999
  THEN
    WRITELN('Количество пробелов как минимум 999')
  ELSE
    WRITELN('Количество пробелов ', Counter)
END.  {CountingBlanksInText}

