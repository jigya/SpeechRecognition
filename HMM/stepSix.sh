#!/bin/bash
rm -rf hmm8
mkdir hmm8
rm -rf dir2
mkdir dir2
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S fileNames0.txt -H hmm7/macros -H hmm7/hmmdefs -M dir2 -p 1 monophones1
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S fileNames1.txt -H hmm7/macros -H hmm7/hmmdefs -M dir2 -p 2 monophones1
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S fileNames2.txt -H hmm7/macros -H hmm7/hmmdefs -M dir2 -p 3 monophones1
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S fileNames3.txt -H hmm7/macros -H hmm7/hmmdefs -M dir2 -p 4 monophones1
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S fileNames4.txt -H hmm7/macros -H hmm7/hmmdefs -M dir2 -p 5 monophones1
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S fileNames5.txt -H hmm7/macros -H hmm7/hmmdefs -M dir2 -p 6 monophones1
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S fileNames6.txt -H hmm7/macros -H hmm7/hmmdefs -M dir2 -p 7 monophones1
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S fileNames7.txt -H hmm7/macros -H hmm7/hmmdefs -M dir2 -p 8 monophones1
HERest -A -D -T 1 -p 0 -t 250.0 150.0 3000.0 -H hmm7/macros -H hmm7/hmmdefs -M hmm8 monophones1 dir2/HER1.acc dir2/HER2.acc dir2/HER3.acc dir2/HER4.acc dir2/HER5.acc dir2/HER6.acc dir2/HER7.acc dir2/HER8.acc
echo "--------------------------------------------------------------------------------"
echo "hmm8 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm9
mkdir hmm9
rm -rf dir2
mkdir dir2
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S fileNames0.txt -H hmm8/macros -H hmm8/hmmdefs -M dir2 -p 1 monophones1
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S fileNames1.txt -H hmm8/macros -H hmm8/hmmdefs -M dir2 -p 2 monophones1
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S fileNames2.txt -H hmm8/macros -H hmm8/hmmdefs -M dir2 -p 3 monophones1
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S fileNames3.txt -H hmm8/macros -H hmm8/hmmdefs -M dir2 -p 4 monophones1
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S fileNames4.txt -H hmm8/macros -H hmm8/hmmdefs -M dir2 -p 5 monophones1
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S fileNames5.txt -H hmm8/macros -H hmm8/hmmdefs -M dir2 -p 6 monophones1
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S fileNames6.txt -H hmm8/macros -H hmm8/hmmdefs -M dir2 -p 7 monophones1
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S fileNames7.txt -H hmm8/macros -H hmm8/hmmdefs -M dir2 -p 8 monophones1
HERest -A -D -T 1 -p 0 -t 250.0 150.0 3000.0 -H hmm8/macros -H hmm8/hmmdefs -M hmm9 monophones1 dir2/HER1.acc dir2/HER2.acc dir2/HER3.acc dir2/HER4.acc dir2/HER5.acc dir2/HER6.acc dir2/HER7.acc dir2/HER8.acc
echo "--------------------------------------------------------------------------------"
echo "hmm9 made!!"
echo "--------------------------------------------------------------------------------"
HLEd -A -D -T 1 -n triphones1 -l '*' -i wintri.mlf mktri.led aligned.mlf
echo "--------------------------------------------------------------------------------"
echo "HLed done, wintri.mlf & triphones1 made!!"
echo "--------------------------------------------------------------------------------"
perl maketrihed monophones1 triphones1
echo "--------------------------------------------------------------------------------"
echo "mktri.hed made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm10
mkdir hmm10
HHEd -A -D -T 1 -H hmm9/macros -H hmm9/hmmdefs -M hmm10 mktri.hed monophones1
echo "--------------------------------------------------------------------------------"
echo "hmm10 made, HHed done!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm11
mkdir hmm11
rm -rf dir2
mkdir dir2
HERest -A -D -T 1 -C configHtk -I wintri.mlf -t 250.0 150.0 3000.0 -S fileNames0.txt -H hmm10/macros -H hmm10/hmmdefs -M dir2 -p 1 triphones1
HERest -A -D -T 1 -C configHtk -I wintri.mlf -t 250.0 150.0 3000.0 -S fileNames1.txt -H hmm10/macros -H hmm10/hmmdefs -M dir2 -p 2 triphones1
HERest -A -D -T 1 -C configHtk -I wintri.mlf -t 250.0 150.0 3000.0 -S fileNames2.txt -H hmm10/macros -H hmm10/hmmdefs -M dir2 -p 3 triphones1
HERest -A -D -T 1 -C configHtk -I wintri.mlf -t 250.0 150.0 3000.0 -S fileNames3.txt -H hmm10/macros -H hmm10/hmmdefs -M dir2 -p 4 triphones1
HERest -A -D -T 1 -C configHtk -I wintri.mlf -t 250.0 150.0 3000.0 -S fileNames4.txt -H hmm10/macros -H hmm10/hmmdefs -M dir2 -p 5 triphones1
HERest -A -D -T 1 -C configHtk -I wintri.mlf -t 250.0 150.0 3000.0 -S fileNames5.txt -H hmm10/macros -H hmm10/hmmdefs -M dir2 -p 6 triphones1
HERest -A -D -T 1 -C configHtk -I wintri.mlf -t 250.0 150.0 3000.0 -S fileNames6.txt -H hmm10/macros -H hmm10/hmmdefs -M dir2 -p 7 triphones1
HERest -A -D -T 1 -C configHtk -I wintri.mlf -t 250.0 150.0 3000.0 -S fileNames7.txt -H hmm10/macros -H hmm10/hmmdefs -M dir2 -p 8 triphones1
HERest -A -D -T 1 -p 0 -t 250.0 150.0 3000.0 -H hmm10/macros -H hmm10/hmmdefs -M hmm11 triphones1 dir2/HER1.acc dir2/HER2.acc dir2/HER3.acc dir2/HER4.acc dir2/HER5.acc dir2/HER6.acc dir2/HER7.acc dir2/HER8.acc
echo "--------------------------------------------------------------------------------"
echo "hmm11 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm12
mkdir hmm12
rm -rf dir2
mkdir dir2
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames0.txt -H hmm11/macros -H hmm11/hmmdefs -M dir2 -p 1 triphones1
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames1.txt -H hmm11/macros -H hmm11/hmmdefs -M dir2 -p 2 triphones1
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames2.txt -H hmm11/macros -H hmm11/hmmdefs -M dir2 -p 3 triphones1
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames3.txt -H hmm11/macros -H hmm11/hmmdefs -M dir2 -p 4 triphones1
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames4.txt -H hmm11/macros -H hmm11/hmmdefs -M dir2 -p 5 triphones1
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames5.txt -H hmm11/macros -H hmm11/hmmdefs -M dir2 -p 6 triphones1
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames6.txt -H hmm11/macros -H hmm11/hmmdefs -M dir2 -p 7 triphones1
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames7.txt -H hmm11/macros -H hmm11/hmmdefs -M dir2 -p 8 triphones1
HERest -A -D -T 1 -p 0 -t 250.0 150.0 3000.0 -H hmm11/macros -H hmm11/hmmdefs -M hmm12 triphones1 dir2/HER1.acc dir2/HER2.acc dir2/HER3.acc dir2/HER4.acc dir2/HER5.acc dir2/HER6.acc dir2/HER7.acc dir2/HER8.acc
echo "--------------------------------------------------------------------------------"
echo "hmm12 made!!"
echo "--------------------------------------------------------------------------------"
HDMan -A -D -T 1 -b sp -n fulllist -g global.ded -l flog beep-tri beep-fixed
echo "--------------------------------------------------------------------------------"
echo "beep-tri made!!"
echo "--------------------------------------------------------------------------------"
rm fulllist1
touch fulllist1
cat fulllist >> fulllist1
cat triphones1 >> fulllist1
perl fixFullList.pl fulllist1 fulllist
echo "--------------------------------------------------------------------------------"
echo "fulllist made!!"
echo "--------------------------------------------------------------------------------"
rm tree.hed
touch tree.hed
cat treeHedHistoricDoc > tree.hed
perl mkclscript.prl TB 350 monophones0 >> tree.hed
cat treeHedHistoricEnd >> tree.hed
echo "--------------------------------------------------------------------------------"
echo "tree.hed made!!"
echo "--------------------------------------------------------------------------------"
