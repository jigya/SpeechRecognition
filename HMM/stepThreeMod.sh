#!/bin/bash
rm wordsMlfWSLess
touch wordsMlfWSLess
perl removingEmptyLines.pl words.mlf wordsMlfWSLess
rm words.mlf
touch words.mlf
cat wordsMlfWSLess > words.mlf
rm wordsMlfWSLess
sed -i '$ d' ./words.mlf
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
