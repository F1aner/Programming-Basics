UNIT WordCounter;

INTERFACE

PROCEDURE BuildDictionary(VAR IFile, OFile: TEXT);

IMPLEMENTATION

USES
  TextUtils, Dictionary, MergeUtils;

CONST
  Empty = '';
  TempFileName = 'TEMP.TXT';
  PortionFileName = 'PORTION.TXT';

PROCEDURE SaveWord(VAR CurrentWord: STRING);
{Чистит слово и добавляет его в дерево}
VAR
  CleanedWord: STRING;
BEGIN {SaveWord}
  CleanedWord := NormalizeDashes(CurrentWord);
  IF CleanedWord <> Empty
  THEN
    BEGIN
      IF IsUniqueLimitReached AND (NOT HasWord(CleanedWord))
      THEN
        Merge(TempFileName, PortionFileName);
      Insert(CleanedWord) 
    END;
  CurrentWord := Empty
END; {SaveWord}

PROCEDURE BuildDictionary(VAR IFile, OFile: TEXT);
{Читает текст посимвольно, собирает слова и строит словарь,
 при переполнении сбрасывает данные на диск и сливает их}
VAR
  Ch: CHAR;
  TempFile: TEXT;
  CurrentWord: STRING;
BEGIN {BuildDictionary}
  CurrentWord := Empty;
  PrepareEmptyFile(TempFileName);
  PrepareEmptyFile(PortionFileName);
  WHILE (NOT EOF(IFile))
  DO
    BEGIN
      READ(IFile, Ch);
      IF IsAllowedChar(Ch)
      THEN
        CurrentWord := CurrentWord + ToLowerCase(Ch)
      ELSE
        SaveWord(CurrentWord)
    END;
  SaveWord(CurrentWord);
  Merge(TempFileName, PortionFileName);
  ASSIGN(TempFile, TempFileName); 
  RESET(TempFile);
  CopyFile(TempFile, OFile)
END; {BuildDictionary}

BEGIN {WordCounter}
END. {WordCounter}
