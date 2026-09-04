UNIT TextUtils;

INTERFACE

FUNCTION IsAllowedChar(Ch: CHAR): BOOLEAN;
FUNCTION IsGreater(Str1, Str2: STRING): BOOLEAN;
FUNCTION ToLowerCase(Ch: CHAR): CHAR;
FUNCTION NormalizeDashes(Str: STRING): STRING;

IMPLEMENTATION

CONST
  UpCh = 'ABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
  LowCh = 'abcdefghijklmnopqrstuvwxyzабвгдеёжзийклмнопрстуфхцчшщъыьэюя';
  AllowedChars = ['a' .. 'z', 'A' .. 'Z', 'а' .. 'я', 'А' .. 'Я', 'Ё', 'ё', '-'];
  Alphabet = '-abcdefghijklmnopqrstuvwxyzабвгдеёжзийклмнопрстуфхцчшщъыьэюя';

FUNCTION IsAllowedChar(Ch: CHAR): BOOLEAN;
{Проверяет, входит ли символ в набор допустимых для слова}
BEGIN {IsAllowedChar}
  IsAllowedChar := Ch IN AllowedChars
END; {IsAllowedChar}

FUNCTION GetDiffIndex(Str1, Str2: STRING): INTEGER;
{Получить индекс символа, где буквы различны}                                  
VAR
  Index, MinLen: INTEGER;
BEGIN {GetDiffIndex}
  IF LENGTH(Str1) < LENGTH(Str2) 
  THEN 
    MinLen := LENGTH(Str1) 
  ELSE 
    MinLen := LENGTH(Str2);
  Index := 1;
  WHILE (Index <= MinLen) AND (Str1[Index] = Str2[Index]) 
  DO
    Index := Index + 1;
  IF Index > MinLen 
  THEN 
    GetDiffIndex := 0 
  ELSE 
    GetDiffIndex := Index
END; {GetDiffIndex}

FUNCTION IsCharGreater(Ch1, Ch2: CHAR): BOOLEAN;
{Сравнение двух символов: TRUE если первый больше второго по алфавиту}
BEGIN {IsCharGreater}
  IsCharGreater := POS(Ch1, Alphabet) > POS(Ch2, Alphabet)
END; {IsCharGreater}

FUNCTION IsGreater(Str1, Str2: STRING): BOOLEAN;
{Сравнивает две строки и если 1-я больше 2-й, то TRUE}
VAR 
  DifIndex: INTEGER;
BEGIN {IsGreater}
  DifIndex := GetDiffIndex(Str1, Str2);
  IF DifIndex <> 0 
  THEN
    IsGreater := IsCharGreater(Str1[DifIndex], Str2[DifIndex])
  ELSE
    IsGreater := LENGTH(Str1) > LENGTH(Str2)
END; {IsGreater}

FUNCTION ToLowerCase(Ch: CHAR): CHAR;
{Превращает заглавную букву в строчную, если изначально не строчная}
VAR
  Position: INTEGER;
BEGIN {ToLowerCase}
  Position := POS(Ch, UpCh);
  IF Position > 0 
  THEN 
    ToLowerCase := LowCh[Position] 
  ELSE 
    ToLowerCase := Ch
END; {ToLowerCase}

FUNCTION NormalizeDashes(Str: STRING): STRING;
{Убирает крайние дефисы и схлопывает множественные дефисы в один}
VAR
  Index: INTEGER;
  ResultStr: STRING;
  LastWasDash: BOOLEAN;
BEGIN {NormalizeDashes}
  ResultStr := '';
  LastWasDash := TRUE;
  FOR Index := 1 TO LENGTH(Str) 
  DO
    IF Str[Index] = '-' 
    THEN 
      LastWasDash := TRUE
    ELSE
      BEGIN
        IF LastWasDash AND (ResultStr <> '') 
        THEN 
          ResultStr := ResultStr + '-';
        ResultStr := ResultStr + Str[Index];
        LastWasDash := FALSE
      END;
  NormalizeDashes := ResultStr        
END; {NormalizeDashes}

BEGIN {TextUtils}
END. {TextUtils}
