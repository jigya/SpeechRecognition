#!/bin/bash
DONE=false
I=0
MONOPHONES=()
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
rm -rf dir2
mkdir dir2
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames0.txt -H hmm0/macros -H hmm0/hmmdefs -M dir2 -p 1 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames1.txt -H hmm0/macros -H hmm0/hmmdefs -M dir2 -p 2 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames2.txt -H hmm0/macros -H hmm0/hmmdefs -M dir2 -p 3 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames3.txt -H hmm0/macros -H hmm0/hmmdefs -M dir2 -p 4 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames4.txt -H hmm0/macros -H hmm0/hmmdefs -M dir2 -p 5 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames5.txt -H hmm0/macros -H hmm0/hmmdefs -M dir2 -p 6 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames6.txt -H hmm0/macros -H hmm0/hmmdefs -M dir2 -p 7 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames7.txt -H hmm0/macros -H hmm0/hmmdefs -M dir2 -p 8 monophones0
HERest -A -D -T 1 -p 0 -t 250.0 150.0 3000.0 -H hmm0/macros -H hmm0/hmmdefs -M hmm1 monophones0 dir2/HER1.acc dir2/HER2.acc dir2/HER3.acc dir2/HER4.acc dir2/HER5.acc dir2/HER6.acc dir2/HER7.acc dir2/HER8.acc
echo "--------------------------------------------------------------------------------"
echo "hmm1 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm2
mkdir hmm2
rm -rf dir2
mkdir dir2
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames0.txt -H hmm1/macros -H hmm1/hmmdefs -M dir2 -p 1 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames1.txt -H hmm1/macros -H hmm1/hmmdefs -M dir2 -p 2 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames2.txt -H hmm1/macros -H hmm1/hmmdefs -M dir2 -p 3 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames3.txt -H hmm1/macros -H hmm1/hmmdefs -M dir2 -p 4 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames4.txt -H hmm1/macros -H hmm1/hmmdefs -M dir2 -p 5 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames5.txt -H hmm1/macros -H hmm1/hmmdefs -M dir2 -p 6 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames6.txt -H hmm1/macros -H hmm1/hmmdefs -M dir2 -p 7 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames7.txt -H hmm1/macros -H hmm1/hmmdefs -M dir2 -p 8 monophones0
HERest -A -D -T 1 -p 0 -t 250.0 150.0 3000.0 -H hmm1/macros -H hmm1/hmmdefs -M hmm2 monophones0 dir2/HER1.acc dir2/HER2.acc dir2/HER3.acc dir2/HER4.acc dir2/HER5.acc dir2/HER6.acc dir2/HER7.acc dir2/HER8.acc
echo "--------------------------------------------------------------------------------"
echo "hmm2 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm3
mkdir hmm3
rm -rf dir2
mkdir dir2
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames0.txt -H hmm2/macros -H hmm2/hmmdefs -M dir2 -p 1 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames1.txt -H hmm2/macros -H hmm2/hmmdefs -M dir2 -p 2 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames2.txt -H hmm2/macros -H hmm2/hmmdefs -M dir2 -p 3 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames3.txt -H hmm2/macros -H hmm2/hmmdefs -M dir2 -p 4 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames4.txt -H hmm2/macros -H hmm2/hmmdefs -M dir2 -p 5 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames5.txt -H hmm2/macros -H hmm2/hmmdefs -M dir2 -p 6 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames6.txt -H hmm2/macros -H hmm2/hmmdefs -M dir2 -p 7 monophones0
HERest -A -D -T 1 -C configHtk -I phones0.mlf -t 250.0 150.0 3000.0 -S fileNames7.txt -H hmm2/macros -H hmm2/hmmdefs -M dir2 -p 8 monophones0
HERest -A -D -T 1 -p 0 -t 250.0 150.0 3000.0 -H hmm2/macros -H hmm2/hmmdefs -M hmm3 monophones0 dir2/HER1.acc dir2/HER2.acc dir2/HER3.acc dir2/HER4.acc dir2/HER5.acc dir2/HER6.acc dir2/HER7.acc dir2/HER8.acc
echo "--------------------------------------------------------------------------------"
echo "hmm3 made!!"
echo "--------------------------------------------------------------------------------"
