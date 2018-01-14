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
DONE=false
I=$((0 + 0))
until $DONE
do
  read line || DONE=true
  MONOPHONES=( "${MONOPHONES[@]}" $line )
  echo ${MONOPHONES[$I]}
  I=$((I + 1))
done < monophones0
hmm0Dir="hmm0/"
protoName="proto"
vFloorsName="vFloors"
tempName="temp"
hmmDefsName="hmmdefs"
macroName="macros"
protoPath=$hmm0Dir$protoName
vFloorsPath=$hmm0Dir$vFloorsName
tempPath=$hmm0Dir$tempName
hmmDefsPath=$hmm0Dir$hmmDefsName
macroPath=$hmm0Dir$macroName
echo "--------------------------------------------------------------------------------"
echo "File Names read!!"
echo "--------------------------------------------------------------------------------"
rm codetr.scp
touch codetr.scp
filename="./codetr.scp"
I=$((0 + 0))
for j in "${MFCCSPATH[@]}"
do
  echo "${AUDIOSPATH[$I]} $j" >> $filename
  I=$((I + 1))
done
sed -i '$ d' $filename
echo "--------------------------------------------------------------------------------"
echo "codetr.scp made!!"
echo "--------------------------------------------------------------------------------"
HCopy -T 1 -C config -S codetr.scp
echo "--------------------------------------------------------------------------------"
echo "MFCCs made!!"
echo "--------------------------------------------------------------------------------"
rm train.scp
touch train.scp
filename="./train.scp"
I=$((0 + 0))
for j in "${MFCCSPATH[@]}"
do
  echo "$j" >> $filename
  I=$((I + 1))
done
sed -i '$ d' $filename
echo "--------------------------------------------------------------------------------"
echo "train.scp made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm0
mkdir hmm0
HCompV -A -D -T 1 -C configHtk -f 0.01 -m -S train.scp -M hmm0 proto
echo "--------------------------------------------------------------------------------"
echo "hmm0 made with prototype!!"
echo "--------------------------------------------------------------------------------"
head -3 $protoPath >> $tempPath && sed -i '1,+2d' $protoPath
cat $vFloorsPath >> $tempPath
rm $vFloorsPath
touch $vFloorsPath
cat $tempPath > $vFloorsPath
mv $vFloorsPath $macroPath
echo "--------------------------------------------------------------------------------"
echo "macros made!!"
echo "--------------------------------------------------------------------------------"
rm $tempPath
touch $tempPath
tail -n +2 $protoPath > $tempPath
rm $hmmDefsPath
touch $hmmDefsPath
for j in "${MONOPHONES[@]}"
do
  echo "~h \"$j\"" >> $hmmDefsPath
  cat $tempPath >> $hmmDefsPath
done
echo "~h \"sil\"" >> $hmmDefsPath
cat $tempPath >> $hmmDefsPath
echo "" >> $hmmDefsPath
rm $protoPath
rm $tempPath
echo "--------------------------------------------------------------------------------"
echo "hmmdefs made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm1
mkdir hmm1
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 1000.0 -S train.scp -H hmm0/macros -H hmm0/hmmdefs -M hmm1 monophones0
echo "--------------------------------------------------------------------------------"
echo "hmm1 made!!"
echo "--------------------------------------------------------------------------------"
wait
rm -rf hmm2
mkdir hmm2
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 1000.0 -S train.scp -H hmm1/macros -H hmm1/hmmdefs -M hmm2 monophones0
echo "--------------------------------------------------------------------------------"
echo "hmm2 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm3
mkdir hmm3
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 1000.0 -S train.scp -H hmm2/macros -H hmm2/hmmdefs -M hmm3 monophones0
echo "--------------------------------------------------------------------------------"
echo "hmm3 made!!"
echo "--------------------------------------------------------------------------------"
