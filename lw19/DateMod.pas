UNIT DateMod;

INTERFACE
TYPE
  Month = (NoMonth, Jan, Feb, Mar, Apr, May, Jun,
                    Jul, Aug, Sep, Oct, Nov, Dec);
  DayNum = 1..31;
  Date   = RECORD
             Mo : Month;
             Day: DayNum
           END;
  FileOfDate = FILE OF Date;

PROCEDURE WriteDate(VAR FOut: TEXT; VAR Res: Date); { Выводит символьное значение месяца }
PROCEDURE ReadDate (VAR FIn: TEXT; VAR Res: Date); {Считывам значение и присваиваем}
FUNCTION  Less(VAR D1, D2: Date): BOOLEAN; { Сравнивает значения дней и месяцев }
PROCEDURE CopyOut(VAR DateFile: FileOfDate); { Копирует данные из входного в выходной файл }

IMPLEMENTATION

PROCEDURE ReadMonth(VAR FIn: TEXT; VAR Mo: Month);
{ Считываем значение Ch1, Ch2, C3 и при соблюдении условий присваиваем Mo значение того или иного месяца }
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN
  READ(FIn, Ch1, Ch2, Ch3);
  IF (Ch1 = 'J') AND (Ch2 = 'A') AND (Ch3 = 'N') THEN Mo := Jan ELSE
  IF (Ch1 = 'F') AND (Ch2 = 'E') AND (Ch3 = 'B') THEN Mo := Feb ELSE
  IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'R') THEN Mo := Mar ELSE
  IF (Ch1 = 'A') AND (Ch2 = 'P') AND (Ch3 = 'R') THEN Mo := Apr ELSE
  IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'Y') THEN Mo := May ELSE
  IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'N') THEN Mo := Jun ELSE
  IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'L') THEN Mo := Jul ELSE
  IF (Ch1 = 'A') AND (Ch2 = 'U') AND (Ch3 = 'G') THEN Mo := Aug ELSE
  IF (Ch1 = 'S') AND (Ch2 = 'E') AND (Ch3 = 'P') THEN Mo := Sep ELSE
  IF (Ch1 = 'O') AND (Ch2 = 'C') AND (Ch3 = 'T') THEN Mo := Oct ELSE
  IF (Ch1 = 'N') AND (Ch2 = 'O') AND (Ch3 = 'V') THEN Mo := Nov ELSE
  IF (Ch1 = 'D') AND (Ch2 = 'E') AND (Ch3 = 'C') THEN Mo := Dec
    ELSE Mo := NoMonth;
END;

PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month);
{ В соответствии со значением Mo выводим в выходной файл символьное значение месяца }
BEGIN
  IF Mo = Jan THEN WRITE(FOut, 'JAN') ELSE
  IF Mo = Feb THEN WRITE(FOut, 'FEB') ELSE
  IF Mo = Mar THEN WRITE(FOut, 'MAR') ELSE
  IF Mo = Apr THEN WRITE(FOut, 'APR') ELSE
  IF Mo = May THEN WRITE(FOut, 'MAY') ELSE
  IF Mo = Jun THEN WRITE(FOut, 'JUN') ELSE
  IF Mo = Jul THEN WRITE(FOut, 'JUL') ELSE
  IF Mo = Aug THEN WRITE(FOut, 'AUG') ELSE
  IF Mo = Sep THEN WRITE(FOut, 'SEP') ELSE
  IF Mo = Oct THEN WRITE(FOut, 'OCT') ELSE
  IF Mo = Nov THEN WRITE(FOut, 'NOV') ELSE
  IF Mo = Dec THEN WRITE(FOut, 'DEC')
    ELSE WRITE(FOut, 'Введён неверный месяц');
END;

PROCEDURE WriteDate(VAR FOut: TEXT; VAR Res: Date);
{ В выходной файл выводим значение даты }
BEGIN
  WriteMonth(FOut, Res.Mo);
  WRITE(FOut, Res.Day:3);
END;

PROCEDURE ReadDate(VAR FIn: TEXT; VAR Res: Date);
{ Выполняем чтение месяца и из входного файла читаем значение дня }
BEGIN
  ReadMonth(FIn, Res.Mo);
  READ(FIn, Res.Day);
END;

FUNCTION Less(VAR D1, D2: Date): BOOLEAN;
  { Сравнивает две даты D1 и D2. Если D1 предшествует D2, то возвращает TRUE. Сравнение сначала происходит по месяцу, затем по дням  }
BEGIN
  IF (D1.Mo < D2.Mo) 
  THEN 
    Less := TRUE
  ELSE 
    IF (D1.Mo > D2.Mo) 
    THEN 
      Less := FALSE
    ELSE 
      Less := (D1.Day < D2.Day);
END;

PROCEDURE CopyOut(VAR DateFile: FileOfDate);
{ Последовательно считывает все записи из файла DateFile. Каждая дата выводится в выходной файл и выполняется переход на новую строку }
VAR
  VarDate: Date;
BEGIN
  WHILE (NOT EOF(DateFile)) 
  DO 
  BEGIN
    READ(DateFile, VarDate);
    WriteDate(OUTPUT, VarDate);
    WRITELN;
  END;
END;

BEGIN
END.
