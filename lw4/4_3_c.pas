PROGRAM SarahRevere(INPUT, OUTPUT);
{Печать сообщения о том как идут британцы, в зависимости 
от того, первым во входе встречается 'land' или 'sea'.}
VAR
  W1, W2, W3, W4, Looking: CHAR;
BEGIN {Sarah Revere}
  {Инициализация W1, W2, W3, W4, Looking}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Looking := 'Y';
  WHILE Looking = 'Y'
  DO
    BEGIN {Проверка окна на для 'land'}
      IF W1 = 'l'
      THEN
        IF W2 = 'a'
        THEN
          IF W3 = 'n'
          THEN
            IF W4 = 'd'
            THEN
              Looking := 'L';
      IF W1 = 's' {Проверка окна для 'sea'}
      THEN
        IF W2 = 'e'
        THEN
          IF W3 = 'a'
          THEN
            Looking := 'S';
      W1 := W2; {Двигать окно, проверять конец данных}
      W2 := W3;
      W3 := W4;
      READ(W4);
      IF W4 = '#'
      THEN
        Looking := 'N';
        
      IF Looking = 'S'
      THEN
        W1 := 's'
      ELSE
        W1 := 'l';
                  
    END; 
  {Создать сообщение Sarah}
  IF Looking = 'L'
  THEN
    WRITELN('The British are coming by land.')
  ELSE
    IF Looking = 'S'
    THEN
      WRITELN('The British are coming by sea.')
    ELSE
      WRITELN('Sarah didn''t say')
END.
