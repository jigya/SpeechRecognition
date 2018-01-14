#!/bin/bash
DONE=false
I=0
FILES=()
AUDIOSPATH=()
MFCCSPATH=()
MONOPHONES=()
BASE="/home/kartikparnami/btp/automatingStepOne/"
until $DONE
do
  read line || DONE=true
  FILES=( "${FILES[@]}" $line )
  echo ${FILES[$I]}
  audioDir="audio/"
  audioExtension=".wav"
  AUDIOSPATH=( "${AUDIOSPATH[@]}" $audioDir$line$audioExtension )
  echo ${AUDIOSPATH[$I]}
  mfccDir="mfcc/"
  mfccExtension=".mfc"
  MFCCSPATH=( "${MFCCSPATH[@]}" $mfccDir$line$mfccExtension )
  echo ${MFCCSPATH[$I]}
  I=$((I + 1))
done < fileNames.txt
hmm3Dir="hmm3/"
hmm0Dir="hmm0/"
hmm4Dir="hmm4/"
currentDir="./"
hmmDefsName="hmmdefs"
tempName="temp"
temp2Name="temp2"
silenceModelName="silenceModel.ded"
macrosName="macros"
hmmDefs4Path=$hmm4Dir$hmmDefsName
hmmDefs3Path=$hmm3Dir$hmmDefsName
tempPath=$hmm4Dir$tempName
temp2Path=$hmm4Dir$temp2Name
silenceModelPath=$currentDir$silenceModelName
macrosPath=$hmm4Dir$macrosName
macrosOldPath=$hmm3Dir$macrosName
echo "--------------------------------------------------------------------------------"
echo "File Names read!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm4
mkdir hmm4
rm $hmmDefs4Path
touch $hmmDefs4Path
cat $hmmDefs3Path > $hmmDefs4Path
rm $tempPath
touch $tempPath
tail --lines=18 $hmmDefs4Path > $tempPath
rm $temp2Path
touch $temp2Path
head --lines=5 $tempPath > $temp2Path
rm $tempPath
touch $tempPath
echo "~h \"sp\"" >> $tempPath
echo "<BEGINHMM>" >> $tempPath
echo "<NUMSTATES> 3" >> $tempPath
echo "<STATE> 2" >> $tempPath
cat $temp2Path >> $tempPath
rm $temp2Path
cat $silenceModelPath >> $tempPath
cat $tempPath >> $hmmDefs4Path
rm $tempPath
echo "--------------------------------------------------------------------------------"
echo "hmm4 hmmdefs made!!"
echo "--------------------------------------------------------------------------------"
cp $macrosOldPath $macrosPath
echo "--------------------------------------------------------------------------------"
echo "hmm4 macros made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm5
mkdir hmm5
HHEd -A -D -T 1 -H hmm4/macros -H hmm4/hmmdefs -M hmm5 sil.hed monophones1
echo "--------------------------------------------------------------------------------"
echo "Hhed done and hmm5 created!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm6
mkdir hmm6
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm5/macros -H  hmm5/hmmdefs -M hmm6 monophones1
echo "--------------------------------------------------------------------------------"
echo "hmm6 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm7
mkdir hmm7
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm6/macros -H hmm6/hmmdefs -M hmm7 monophones1
echo "--------------------------------------------------------------------------------"
echo "hmm7 made!!"
echo "--------------------------------------------------------------------------------"
HVite -A -D -T 1 -l '*' -o SWT -b sent-end -C configHtk -H hmm7/macros -H hmm7/hmmdefs -i aligned.mlf -m -t 250.0 150.0 1000.0 -y lab -a -I words.mlf -S train.scp dict monophones1> HVite_log
echo "--------------------------------------------------------------------------------"
echo "Hvite alignment done, PLEASE CHEACK HVITE_LOG BEFORE MOVING FURTHER!!"
echo "--------------------------------------------------------------------------------"
