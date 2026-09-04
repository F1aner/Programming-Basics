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

    {DP1.3 проверка на 'land'}
      IF W1 = 'l'
      THEN
        IF W2 = 'a'
        THEN
          IF W3 = 'n'
          THEN
            IF W4 = 'd'
            THEN
              Looking := 'L';

    {DP1.4 проверка на 'sea'}
    IF W2 = 's'
    THEN
      IF W3 = 'e'
      THEN
        IF W4 = 'a'
        THEN
          Looking := 'S'
  END;

  WRITELN('Looking is ', Looking)
END.
