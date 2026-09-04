PROGRAM SarahRevere(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, Looking: CHAR;
BEGIN
  {DP1.1 Инциализация}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Looking := 'Y';

  {DP1 + DP1.2 + DP1.3 + DP1.4}
  WHILE Looking = 'Y'
  DO
    BEGIN
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      IF W4 = '#'
      THEN
        Looking := 'N';

    {Проверка на 'land'}
      IF (W1 = 'l') AND (W2 = 'A') AND (W3 = 'n') AND (W4 = 'd')
      THEN
        Looking := 'L';

    {Проверка на 'sea'}
      IF (W2 = 's') AND (W3 = 'e') AND (W4 = 'a')
      THEN
        Looking := 'S'
    END;

  {DP1.5 Создаем сообщение Sarah}
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
