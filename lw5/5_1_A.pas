PROGRAM IFSort3(INPUT, OUTPUT);
VAR
  Ch1, Ch2, Ch3: Char;
BEGIN {IFSort3}
  READ(Ch1, Ch2, Ch3);
  WRITELN('Входные данные ', Ch1, Ch2, Ch3);
  WRITE('Сортированные данные ');
  {Сортируем Ch1, Ch2, Ch3 ? OUTPUT}
  IF Ch1 < Ch2
  THEN
    {Ch1 < Ch2:сортируем Ch1, Ch2, Ch3 ? OUTPUT}
  ELSE
    {Ch2 <= Ch1:сортируем Ch1, Ch2, Ch3 ? OUTPUT}
END. {IFsort3}
