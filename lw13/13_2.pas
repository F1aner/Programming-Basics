PROGRAM RunLexico(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  Ch, Result: CHAR; 
  
PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
{Result 0, 1, 2 если лексикографический пор€док F1 =, <, > чем F2       
соответственно. ‘актические параметры, соответствующие F1 и F2,
должны быть различными}
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0'; 
  WHILE (NOT EOLN(F1) AND NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF (Ch1 < Ch2)
      THEN {Ch1 < Ch2 или F1 короче F2}
        Result := '1'
      ELSE
        IF (Ch1 > Ch2)
        THEN {Ch1 > Ch2 или F2 короче F1}
          Result := '2'
    END;
  IF Result = '0'
  THEN 
    BEGIN
      IF EOLN(F1) AND NOT EOLN(F2)
      THEN
        Result := '1'
      ELSE
        IF NOT EOLN(F1) AND EOLN(F2)
        THEN
          Result := '2'
    END;
  IF Result = '1'
  THEN
    WRITELN('ѕерва€ строка короче второй')
  ELSE
    IF Result = '2'
    THEN
      WRITELN('ѕерва€ строка длиннее второй')
    ELSE
      WRITELN('ѕерва€ и втора€ строки равны') 
END; {Lexico}


BEGIN
  REWRITE(F1);
  WHILE NOT EOLN 
  DO
    BEGIN
      READ(Ch);
      WRITE(F1, Ch)
    END;                                                                                          
    READLN;
    WRITELN(F1);  
    REWRITE(F2);
    WHILE NOT EOLN DO
    BEGIN
      READ(Ch);
      WRITE(F2, Ch)
    END;
    WRITELN(F2);  
    Lexico(F1, F2, Result)
END.
