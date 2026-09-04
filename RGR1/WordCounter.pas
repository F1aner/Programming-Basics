UNIT WordCounter;

INTERFACE

USES
  Dictionary;

PROCEDURE BuildDictionary(VAR F: TEXT);

IMPLEMENTATION

USES
  TextUtils;
  
CONST
  MaxUniqueWords = 4;  
               
PROCEDURE ProcessWordStr(VAR WordStr: STRING);
{Готовит строку и вставляет слово в дерево, если оно не пустое}
VAR
  WasFull: BOOLEAN;
BEGIN {ProcessWordStr}
  IF LENGTH(WordStr) > 0 
  THEN
    BEGIN
      WordStr := NormalizeDashes(WordStr);
      IF WordStr <> ''
      THEN
        BEGIN
          WasFull := IsUniqueLimitReached; 
          Insert(WordStr);
          IF (NOT WasFull) AND IsUniqueLimitReached
          THEN
            WRITELN('Cловарь переполнен. Превышен лимит в ', MaxUniqueWords, ' уникальных слов. Новые слова не были обработаны') 
        END
    END; 
  WordStr := ''
END; {ProcessWordStr}

PROCEDURE BuildDictionary(VAR F: TEXT);
{Читает текст посимвольно, собирает слова и отправляет их в дерево}
VAR
  Ch: CHAR;
  WordStr: STRING;
BEGIN {BuildDictionary}
  WordStr := '';
  WHILE (NOT EOF(F))  
  DO
    BEGIN
      READ(F, Ch);
      IF IsAllowedChar(Ch) 
      THEN
        WordStr := WordStr + ToLowerCase(Ch)
      ELSE
        ProcessWordStr(WordStr)
    END;
  ProcessWordStr(WordStr)
END; {BuildDictionary}

BEGIN {WordCounter}
END. {WordCounter}
