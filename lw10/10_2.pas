PROGRAM FormattingString(INPUT, OUTPUT);
VAR
  Ch, Flag: CHAR;
BEGIN { FormattingString }
  {
  Флаги:
  'O' - скобки
  'C' - конец скобок
  'B' - begin
  'D' - default
  'S' - строка
  }
  Flag := 'D';
  WHILE NOT EOLN AND (Ch <> '.') 
  DO
    BEGIN
      READ(Ch);
      {BEGIN}  
      IF ((Ch = 'B') AND (Flag <> 'O')) OR (Flag = 'B')  
      THEN
        BEGIN                                                               
          Flag := 'B';
          IF (Ch = 'R') OR (Ch = 'W') OR (Ch = ';') {Операторы на R, W и ;}
          THEN
            BEGIN 
              Flag := 'D';
              WRITELN('BEGIN');
              WRITE('  ')
            END
        END;
      {Скобки}   
      IF (Ch = '(') OR (Flag = 'O') OR (Flag = 'C')
      THEN
        BEGIN
          IF Flag = 'D' {Скобки открылись}
          THEN
            Flag := 'O';                              
          IF (Ch <> ' ') AND (Ch <> ',') AND (Ch <> ')') AND (Ch <> ';') AND (Flag <> 'C') {Вывод символа, пропуск всего другого}
          THEN
            WRITE(Ch);          
          IF Ch = ')' {Закрытие скобки}
          THEN
            BEGIN
              Flag := 'C';
              WRITE(Ch)
            END;
          IF (Ch <> ')') AND (Flag = 'C') {Сброс флага}
          THEN
            Flag := 'D';           
          IF Ch = ',' {Пробел после запятой}
          THEN
            WRITE(', ')            
        END; 
      {Точка с запятой}    
      IF (Ch = ';') OR (Flag = 'S')
      THEN
        BEGIN
          Flag := 'S'; {Флаг S - переход на новую строку}
          IF Ch = ';' {Вывод ;}
          THEN
            WRITE(Ch);
          IF (Ch = 'W') OR (Ch = 'R') {Найден символ после ; - переходим на новую строку}
          THEN
            BEGIN
              Flag := 'D';
              WRITELN;
              WRITE('  ')
            END;
          IF Ch = 'E' {Нашли END}
          THEN
            Flag := 'D'    
        END;
      {END}     
      IF (Ch = '.') AND (Flag <> 'O') {Ищем . после END}
      THEN
        BEGIN
          WRITELN;
          WRITE('END.')
        END;
      {READ}    
      IF (Ch = 'A') AND (Flag <> 'O') {Считываем по 'A', т.к. WRITE / WRITELN содержит 'R', но не 'A'}
      THEN                          
        WRITE('READ');
      {WRITE}                           
      IF (Ch = 'W') AND (Flag <> 'O')
      THEN
        WRITE('WRITE');
      {LN}  
      IF (Ch = 'L') AND (Flag <> 'O')
      THEN
        WRITE('LN');          
    END        
END. {FormattingString}
