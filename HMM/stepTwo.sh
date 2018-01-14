#!/bin/bash
DONE=false
I=0
FILES=()
AUDIOSPATH=()
PHONESPATH=()
WORDSPATH=()
until $DONE
do
  read line || DONE=true
  FILES=( "${FILES[@]}" $line )
  echo ${FILES[$I]}
  #audioDir="audio/"
  #audioExtension=".wav"
  #AUDIOSPATH=( "${AUDIOSPATH[@]}" $audioDir$line$audioExtension )
  #echo ${AUDIOSPATH[$I]}
  #phonesDir="phones/"
  #phonesExtension=".phones"
  #PHONESPATH=( "${PHONESPATH[@]}" $phonesDir$line$phonesExtension )
  #echo ${PHONESPATH[$I]}
  wordsDir="words/"
  wordsExtension=".words"
  WORDSPATH=( "${WORDSPATH[@]}" $wordsDir$line$wordsExtension )
  #echo ${WORDSPATH[$I]}
  I=$((I + 1))
done < fileNames.txt
echo "--------------------------------------------------------------------------------"
echo "File Names read!!"
echo "--------------------------------------------------------------------------------"
#python AddPhonesUnknownWords.py
echo "--------------------------------------------------------------------------------"
echo "beep-fixed made!!"
echo "--------------------------------------------------------------------------------"
rm prompts.words
touch prompts.words
for j in "${WORDSPATH[@]}"
do
	cat $j >> prompts.words
done
touch promptswsless2
perl removingEmptyLines.pl prompts.words promptswsless2
rm wlist2
perl prompts2wlist promptswsless2 wlist2
rm promptswsless2
echo "sent-end" >> prompts.words
echo "sent-start" >> prompts.words
echo "--------------------------------------------------------------------------------"
echo "prompts.words populated."
echo "--------------------------------------------------------------------------------"
touch promptswsless
perl removingEmptyLines.pl prompts.words promptswsless
rm prompts.words
cat promptswsless > prompts.words
rm promptswsless
echo "--------------------------------------------------------------------------------"
echo "Whitespaces from prompts.words deleted."
echo "--------------------------------------------------------------------------------"
rm wlist
perl prompts2wlist prompts.words wlist
echo "--------------------------------------------------------------------------------"
echo "wlist made!"
echo "--------------------------------------------------------------------------------"
HDMan -m -w wlist -n monophones1 -l dlog dict beep-fixed names
filename="monophones1"
echo "--------------------------------------------------------------------------------"
echo "Dictionary made and monophones1 made!"
echo "--------------------------------------------------------------------------------"
rm monophones0
grep -v sp monophones1 > monophones0
echo "--------------------------------------------------------------------------------"
echo "monophones0 made!"
echo "--------------------------------------------------------------------------------"
perl -pe 's/\r?\n/|/' wlist2 > gram
sed -ie 's/|$//' gram
rm tempGram
touch tempGram
echo "\$words = " >> tempGram
cat gram >> tempGram
echo ";" >> tempGram
echo "(sent-start <\$words> sent-end)" >> tempGram
#cat tempGram
rm gram
touch gram
cat tempGram > gram
rm tempGram
echo "--------------------------------------------------------------------------------"
echo "gram made!"
echo "--------------------------------------------------------------------------------"
HParse gram wdnet
echo "--------------------------------------------------------------------------------"
echo "wdnet made!"
echo "--------------------------------------------------------------------------------"
