UNIT WordUtils;

INTERFACE

PROCEDURE ReadStat(VAR IFile: TEXT; VAR Word: STRING; VAR Count: INTEGER);
PROCEDURE WriteStat(VAR OFile: TEXT; Word: STRING; Count: INTEGER);

IMPLEMENTATION

CONST
  Digits = '0123456789';
  Empty = '';
  SpaceSymbol = ' ';
  Base = 10;

FUNCTION ExtractWord(Str: STRING): STRING;
{Берет слово до пробела}
VAR
  SpacePos, CharIndex: INTEGER;
  ResultWord: STRING;
BEGIN {ExtractWord}
  SpacePos := POS(SpaceSymbol, Str);
  IF SpacePos = 0
  THEN
    ExtractWord := Str
  ELSE
    BEGIN
      ResultWord := Empty;
      FOR CharIndex := 1 TO SpacePos - 1
      DO
        ResultWord := ResultWord + Str[CharIndex];
      ExtractWord := ResultWord
    END
END; {ExtractWord}

FUNCTION ExtractCount(Str: STRING): INTEGER;
{Берет число после пробела}
VAR
  SpacePos, CharIndex, DigitPos: INTEGER;
  ResultNum: INTEGER;
BEGIN {ExtractCount}
  SpacePos := POS(SpaceSymbol, Str);
  ResultNum := 0;
  IF SpacePos > 0
  THEN
    FOR CharIndex := SpacePos + 1 TO LENGTH(Str)
    DO
      BEGIN
        DigitPos := POS(Str[CharIndex], Digits);
        IF DigitPos > 0
        THEN
          ResultNum := ResultNum * Base + (DigitPos - 1)
      END;
  ExtractCount := ResultNum
END; {ExtractCount}

FUNCTION IntToString(Num: INTEGER): STRING;
{Конвертирует число в строку}
VAR
  ResultText: STRING;
  WorkNum: INTEGER;
BEGIN {IntToString}
  IF Num = 0
  THEN
    IntToString := Digits[1]
  ELSE
    BEGIN
      ResultText := Empty;
      WorkNum := Num;
      WHILE WorkNum > 0
      DO
        BEGIN
          ResultText := Digits[(WorkNum MOD Base) + 1] + ResultText;
          WorkNum := WorkNum DIV Base
        END;
      IntToString := ResultText
    END
END; {IntToString}

PROCEDURE ReadStat(VAR IFile: TEXT; VAR Word: STRING; VAR Count: INTEGER);
{Читает одну строку "слово количество"}
VAR
  Str: STRING;
BEGIN {ReadStat}
  Word := Empty;
  Count := 0;
  IF NOT EOF(IFile)
  THEN
    BEGIN
      READLN(IFile, Str);
      Word := ExtractWord(Str);
      Count := ExtractCount(Str)
    END
END; {ReadStat}

PROCEDURE WriteStat(VAR OFile: TEXT; Word: STRING; Count: INTEGER);
{Записывает одну строку "слово количество"}
BEGIN {WriteStat}
  WRITELN(OFile, Word, SpaceSymbol, IntToString(Count))
END; {WriteStat}

BEGIN {WordUtils}
END. {WordUtils}
