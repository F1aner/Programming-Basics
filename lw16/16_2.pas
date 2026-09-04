PROGRAM SarahRevere(INPUT, OUTPUT); 
VAR
  W1, W2, W3, W4: CHAR; 
  Looking, Land, Sea: BOOLEAN;

PROCEDURE LandSeaElse; {¬ывод сообщени€ Sarah}
BEGIN {LandSeaElse}
  IF land
  THEN
    WRITELN('The British are coming by land')
  ELSE
    IF sea
    THEN
      WRITELN('The British are coming by sea')
    ELSE
      WRITELN('Sarah didn''t say')
END; {LandSeaElse}
    
PROCEDURE InitializationAndCondition;
BEGIN {InitializationAndCondition}
  {»нициализаци€}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';  
  Looking := NOT EOLN;
  Land := FALSE; 
  Sea := FALSE;                         
  WHILE Looking AND NOT (Land OR Sea)   
  DO
    BEGIN
      {движение окна}
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      Looking := NOT EOLN;
      {проверка окна на land}
      Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd');
      {проверка окна на sea}
      Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a')    
    END;  
END; {InitializationAndCondition}

BEGIN {SarahRevere} 
  InitializationAndCondition;
  LandSeaElse;
END.  {SarahRevere} 
