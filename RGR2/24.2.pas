PROGRAM CountWords(INPUT, OUTPUT);
{Подсчитывает число слов в текстовом файле без ограничений по длине,
  используя внешнюю сортировку слиянием}
USES
  WordCounter;
CONST
  InputFileName = 'book-war-and-peace.TXT';
  OutputFileName = 'OUTPUT.TXT';
VAR
  InputFile, OutputFile: TEXT;     
BEGIN {CountWords}
  ASSIGN(InputFile,  InputFileName);
  ASSIGN(OutputFile, OutputFileName);
  RESET(InputFile);
  REWRITE(OutputFile);
  BuildDictionary(InputFile, OutputFile)
END. {CountWords}
