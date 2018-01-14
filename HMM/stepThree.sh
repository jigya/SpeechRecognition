#!/bin/bash
DONE=false
I=0
FILES=()
AUDIOSPATH=()
PHONESPATH=()
WORDSPATH=()
LABSPATH=()
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
  labsExtension=".lab"
  LABSPATH=( "${LABSPATH[@]}" $line$labsExtension )
  #echo ${WORDSPATH[$I]}
  I=$((I + 1))
done < fileNames.txt
echo "--------------------------------------------------------------------------------"
echo "File Names read!!"
echo "--------------------------------------------------------------------------------"
rm words.mlf
touch words.mlf
filename="./words.mlf"
echo "#!MLF!#" > $filename
I=$((0 + 0))
for j in "${WORDSPATH[@]}"
do
  echo "\"*/${LABSPATH[$I]}\"" >> $filename
  cat $j >> $filename
  echo "." >> $filename
  I=$((I + 1))
done
echo "--------------------------------------------------------------------------------"
echo "words.mlf made!!"
echo "--------------------------------------------------------------------------------"
rm wordsMlfWSLess
touch wordsMlfWSLess
perl removingEmptyLines.pl words.mlf wordsMlfWSLess
rm words.mlf
touch words.mlf
cat wordsMlfWSLess > words.mlf
rm wordsMlfWSLess
sed -i '$ d' $filename
echo "--------------------------------------------------------------------------------"
echo "words.mlf Formatted!!"
echo "--------------------------------------------------------------------------------"
HLEd -A -D -T 1 -l '*' -d dict -i phones0.mlf mkphones0.led words.mlf
echo "--------------------------------------------------------------------------------"
echo "phones0.mlf made!!"
echo "--------------------------------------------------------------------------------"
HLEd -A -D -T 1 -l '*' -d dict -i phones1.mlf mkphones1.led words.mlf
echo "--------------------------------------------------------------------------------"
echo "phones1.mlf made!!"
echo "--------------------------------------------------------------------------------"
