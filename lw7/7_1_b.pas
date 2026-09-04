PROGRAM BubbleSort(INPUT, OUTPUT);
{Сортируем первую строку INPUT в OUTPUT}
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
BEGIN {BubbleSort}
  {Копируем INPUT в F1}
  REWRITE(F1);
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WRITE(F1, Ch);
    END;
  WRITELN(F1);
  Sorted := 'N';
  WHILE Sorted ='N'
  DO
    BEGIN
    Sorted := 'Y';
    RESET(F1);
    REWRITE(F2);
    WRITE(OUTPUT, 'F2: ');
    READ(F1, Ch1);
    READ(F1, Ch2);
      {Копируем F1 в F2, првоеряя сортированность
      и переставляя первые соседние символы по порядку}
      {Выводим min(Ch1,Ch2) в F2, записывая отсортированные символы}
    IF Ch1 <= Ch2
    THEN
      BEGIN
        WRITE(OUTPUT, Ch1);
        Ch1 := Ch2
      END
    ELSE
      BEGIN
        WRITE(OUTPUT, Ch2);
        {Sorted := 'N'}
      END
      {Копируем F2 в F1}
    END;
  {Копируем F1 в OUTPUT}
  RESET(F1);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      {WRITE(OUTPUT, Ch)}
    END;
  WRITELN(OUTPUT)
END. {BubbleSort}

