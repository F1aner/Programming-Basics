PROGRAM IFSort3(INPUT, OUTPUT);
VAR
  Ch1, Ch2, Ch3: Char;
BEGIN {IFSort3}
  READ(Ch1, Ch2, Ch3);
  WRITELN('¬ходные данные ', Ch1, Ch2, Ch3);
  WRITE('—ортированные данные ');
  {—ортируем Ch1, Ch2, Ch3 в OUTPUT}
  IF Ch1 < Ch2
  THEN
    IF Ch2 < Ch3
    THEN {Ch1 < Ch2 < Ch3: сортируем Ch1, Ch2, Ch3 в OUTPUT}
      WRITELN(Ch1, Ch2, Ch3)
    ELSE
      IF Ch1 < Ch3
      THEN {Ch1 < Ch3 <= Ch2: сортируем Ch1, Ch2, Ch3 в OUTPUT}
        WRITELN(Ch1, Ch3, Ch2)
      ELSE {Ch3 <= Ch1 < Ch2: сортируем Ch1, Ch2, Ch3 в OUTPUT}
        WRITELN(Ch3, Ch1, Ch2)
  ELSE
    {Ch2 <= Ch1:сортируем Ch1, Ch2, Ch3 в OUTPUT}
    IF Ch1 < Ch3
    THEN {Ch2 <= Ch1 < Ch3: сортируем Ch1, Ch2, Ch3 в OUTPUT}
      WRITELN(Ch2, Ch1, Ch3)
    ELSE
      {Ch2 <= Ch1, Ch3 <= Ch1:сортируем Ch1, Ch2, Ch3 в OUTPUT}
      IF Ch2 < Ch3
      THEN {Ch2 < Ch3 <= Ch1: сортируем Ch1, Ch2, Ch3 в OUTPUT}
        WRITELN(Ch2, Ch3, Ch1)
      ELSE {Ch3 <= Ch2 <= Ch1: сортируем Ch1, Ch2, Ch3 в OUTPUT}
        WRITELN(Ch3, Ch2, Ch1)
END. {IFsort3}       
