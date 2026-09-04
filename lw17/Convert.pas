PROGRAM Convert (INPUT, OUTPUT);
VAR
  Base, Number: INTEGER;
{¬ключить PROCEDURE StringToInt
 (VAR F: TEXT; VAR Base, Result: INTEGER);
 F=<,x#y, R>, где x Ц строка цифр, Base Ц целое число, 
 2 <= Base <= 16, задающее их систему исчислени€ --> 
 F, Result := <x#, y, R>, N(x), где N Ц целое значение, 
 имеющее символьное представление x}

PROCEDURE StringToInt (VAR F: TEXT; VAR Base, Result: INTEGER);
{F=<,x#y, R>, где x Ц строка цифр, Base Ц целое число, 
 2 <= Base <= 16, задающее их систему исчислени€ --> 
 F, Result := <x#, y, R>, N(x), где N Ц целое значение, 
 имеющее символьное представление x}
  PROCEDURE CharToDigit (VAR Ch: CHAR; VAR Result: INTEGER);
    {(С0Т <= Ch <= С9Т OR СAТ <= Ch <= СFТ -->
    Result := число соответствующее Ch ) |
    NOT (С0Т <= Ch <= С9Т OR СAТ <= Ch <= СFТ) --> 
    Result := 0)}
    BEGIN {CharToDigit}
      IF Ch = '0' THEN Result := 0 ELSE
      IF Ch = '1' THEN Result := 1 ELSE
      IF Ch = '2' THEN Result := 2 ELSE
      IF Ch = '3' THEN Result := 3 ELSE
      IF Ch = '4' THEN Result := 4 ELSE
      IF Ch = '5' THEN Result := 5 ELSE
      IF Ch = '6' THEN Result := 6 ELSE
      IF Ch = '7' THEN Result := 7 ELSE
      IF Ch = '8' THEN Result := 8 ELSE
      IF Ch = '9' THEN Result := 9 ELSE
      IF Ch = 'A' THEN Result := 10 ELSE
      IF Ch = 'B' THEN Result := 11 ELSE
      IF Ch = 'C' THEN Result := 12 ELSE
      IF Ch = 'D' THEN Result := 13 ELSE
      IF Ch = 'E' THEN Result := 14 ELSE
      IF Ch = 'F' THEN Result := 15 
      ELSE
        Result := 0
    END; {CharToDigit}  
VAR
  Ch: CHAR;
  Digit: INTEGER;
BEGIN {StringToInt}
  Result := 0;
  READ(F, Ch);
  WHILE (Ch = ' ') AND NOT EOF(F) 
  DO
    BEGIN
      WRITE(Ch);
      READ(F, Ch);
    END;
  WRITE(Ch);
  WHILE(Ch <> '#') AND (Ch <> ' ')
  DO
    BEGIN
      {Digit := число, соотвествующее Ch в Base}
      CharToDigit(Ch, Digit);    
      Result := Result * Base + Digit;
      READ(F, Ch);
      WRITE(Ch)
    END   
END;  {StringToInt}

BEGIN {Convert}
  READ(Base);
  StringToInt(INPUT, Base, Number);
  WRITELN;
  WRITELN('ƒес€тичное значение: ', Number)
END. {Convert}
