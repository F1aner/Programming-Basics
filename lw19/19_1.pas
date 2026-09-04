PROGRAM Prime(INPUT, OUTPUT); //Алгоритм Эратосфена
CONST
  MaxNumber = 100;
  MinNumber = 14;
  Base = 1;
TYPE
  PrimeSet = MinNumber .. MaxNumber;
  RangePrimeSet = SET OF PrimeSet;
VAR
  Numbers: RangePrimeSet;
  CurrentNumber, NumberForOut: INTEGER;
BEGIN
  Numbers := [MinNumber .. MaxNumber];  
  CurrentNumber := MinNumber;  
  WHILE CurrentNumber <= MaxNumber
  DO
    BEGIN
      IF CurrentNumber IN Numbers 
      THEN
        BEGIN
          WRITE(CurrentNumber, ' ');
          NumberForOut := CurrentNumber;  
          WHILE NumberForOut <= MaxNumber
          DO
            BEGIN
              Numbers := Numbers - [NumberForOut];
              NumberForOut := NumberForOut + CurrentNumber
            END
        END;
      CurrentNumber := CurrentNumber + Base
    END;
  WRITELN
END.
