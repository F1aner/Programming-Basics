PROGRAM RemoveExtraSpaces(INPUT, OUTPUT);
VAR
  Ch, Flag: CHAR;
BEGIN
  Ch := ' ';
  Flag := ' ';
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      IF Ch <> ' '
      THEN
        BEGIN
          IF Flag = 'E'
          THEN
            WRITE(' ', Ch)  
          ELSE
            WRITE(Ch);
          Flag := 'S'      
        END
      ELSE
        IF Flag = 'S'
        THEN
          Flag := 'E'           
    END;  
  WRITELN  
END.
