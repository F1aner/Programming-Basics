PROGRAM XPrint(INPUT, OUTPUT);

CONST
  Size = 5;
  MatrixSize = Size * Size;
  SymbolLetter = 'X';
  SymbolSpace = ' ';
  MatrixH = [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
  MatrixV = [1, 5, 6, 10, 12, 14, 17, 19, 23];
  MatrixA = [3, 7, 9, 12, 13, 14, 16, 20, 21, 25];
  MatrixF = [1, 2, 3, 4, 5, 6, 11, 12, 13, 16, 21];
  AllowedLetters = ['H', 'V', 'A', 'F'];
  
TYPE
  MatrixType = SET OF 1..MatrixSize;
  
VAR
  Letter: CHAR;
  Matrix: MatrixType;
      
FUNCTION CheckLetter(VAR Letter: CHAR): BOOLEAN;
{ Функция, которая имеет логический тип. Если наша буква находится в числе AllowedLetters, то присваиваем значение TRUE. В ином случае FALSE }    
BEGIN { ReadMatrix }
  IF Letter IN AllowedLetters
  THEN
    CheckLetter := TRUE
  ELSE
    CheckLetter := FALSE    
END; { ReadMatrix }

FUNCTION GetMatrix(VAR Ch: CHAR): MatrixType;
BEGIN { GetMatrix }
  GetMatrix := [];
  CASE Ch OF
    'H': GetMatrix := MatrixH;
    'V': GetMatrix := MatrixV;
    'A': GetMatrix := MatrixA;
    'F': GetMatrix := MatrixF
  END
END; { GetMatrix }

PROCEDURE WriteMatrix(VAR FOut: TEXT; VAR Matrix: MatrixType);
{ Выводит матрицу 5*5 в FOut }
VAR
  I, J, Position: INTEGER;
BEGIN { WriteMatrix }
  FOR I := 1 TO Size
  DO
    BEGIN
      FOR J := 1 TO Size
      DO
        BEGIN
          Position := (I - 1) * Size + J;
          IF Position IN Matrix
          THEN
            WRITE(FOut, SymbolLetter)
          ELSE
            WRITE(FOut, SymbolSpace)
        END;
      WRITELN(FOut)
    END;
  WRITELN(FOut)      
END; { WriteMatrix }

BEGIN { XPrint }
  IF (NOT EOF(INPUT)) AND (NOT EOLN(INPUT))
  THEN
    BEGIN
      READ(INPUT, Letter);
      IF CheckLetter(Letter)
      THEN
        BEGIN
          Matrix := GetMatrix(Letter);
          WriteMatrix(OUTPUT, Matrix)  
        END
      ELSE
        WRITELN('Ошибка: символ не определён') 
    END
  ELSE
    WRITELN('Ошибка: нужно ввести символ')        
END. { XPrint }
