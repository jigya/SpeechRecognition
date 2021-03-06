#!/bin/bash
rm -rf hmm8
mkdir hmm8
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm7/macros -H  hmm7/hmmdefs -M hmm8 monophones1
rm -rf hmm9
mkdir hmm9
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm8/macros -H  hmm8/hmmdefs -M hmm9 monophones1
rm -rf hmm10
mkdir hmm10
HHEd -A -D -T 1 -H hmm9/macros -H hmm9/hmmdefs -M hmm10 incMixtures.hed monophones1
rm -rf hmm11
mkdir hmm11
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm10/macros -H  hmm10/hmmdefs -M hmm11 monophones1
rm -rf hmm12
mkdir hmm12
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm11/macros -H  hmm11/hmmdefs -M hmm12 monophones1
rm -rf hmm13
mkdir hmm13
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm12/macros -H  hmm12/hmmdefs -M hmm13 monophones1
echo "Hmm 13 -p -5" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm13/macros -H hmm13/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p -5.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt
#echo "Hmm 13 -p 5" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm13/macros -H hmm13/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 5.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt

rm -rf hmm14
mkdir hmm14
HHEd -A -D -T 1 -H hmm13/macros -H hmm13/hmmdefs -M hmm14 incMixtures2.hed monophones1
rm -rf hmm15
mkdir hmm15
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm14/macros -H  hmm14/hmmdefs -M hmm15 monophones1
rm -rf hmm16
mkdir hmm16
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm15/macros -H  hmm15/hmmdefs -M hmm16 monophones1
rm -rf hmm17
mkdir hmm17
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm16/macros -H  hmm16/hmmdefs -M hmm17 monophones1
echo "Hmm 17 -p -5" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm17/macros -H hmm17/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p -5.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt
#echo "Hmm 17 -p 5" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm17/macros -H hmm17/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 5.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt

rm -rf hmm18
mkdir hmm18
HHEd -A -D -T 1 -H hmm17/macros -H hmm17/hmmdefs -M hmm18 incMixtures3.hed monophones1
rm -rf hmm19
mkdir hmm19
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm18/macros -H  hmm18/hmmdefs -M hmm19 monophones1
rm -rf hmm20
mkdir hmm20
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm19/macros -H  hmm19/hmmdefs -M hmm20 monophones1
rm -rf hmm21
mkdir hmm21
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm20/macros -H  hmm20/hmmdefs -M hmm21 monophones1
echo "Hmm 21 -p -5" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm21/macros -H hmm21/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p -5.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt
#echo "Hmm 21 -p 5" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm21/macros -H hmm21/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 5.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt


rm -rf hmm22
mkdir hmm22
HHEd -A -D -T 1 -H hmm21/macros -H hmm21/hmmdefs -M hmm22 incMixtures4.hed monophones1
rm -rf hmm23
mkdir hmm23
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm22/macros -H  hmm22/hmmdefs -M hmm23 monophones1
rm -rf hmm24
mkdir hmm24
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm23/macros -H  hmm23/hmmdefs -M hmm24 monophones1
rm -rf hmm25
mkdir hmm25
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm24/macros -H  hmm24/hmmdefs -M hmm25 monophones1
echo "Hmm 25 -p -5" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm25/macros -H hmm25/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p -5.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt
#echo "Hmm 25 -p 5" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm25/macros -H hmm25/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 5.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt

rm -rf hmm26
mkdir hmm26
HHEd -A -D -T 1 -H hmm25/macros -H hmm25/hmmdefs -M hmm26 incMixtures5.hed monophones1
rm -rf hmm27
mkdir hmm27
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm26/macros -H  hmm26/hmmdefs -M hmm27 monophones1
rm -rf hmm28
mkdir hmm28
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm27/macros -H  hmm27/hmmdefs -M hmm28 monophones1
rm -rf hmm29
mkdir hmm29
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm28/macros -H  hmm28/hmmdefs -M hmm29 monophones1
echo "Hmm 29 -p -5" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm29/macros -H hmm29/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p -5.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt
#echo "Hmm 29 -p 5" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm29/macros -H hmm29/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 5.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt

rm -rf hmm30
mkdir hmm30
HHEd -A -D -T 1 -H hmm29/macros -H hmm29/hmmdefs -M hmm30 incMixtures6.hed monophones1
rm -rf hmm31
mkdir hmm31
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm30/macros -H  hmm30/hmmdefs -M hmm31 monophones1
rm -rf hmm32
mkdir hmm32
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm31/macros -H  hmm31/hmmdefs -M hmm32 monophones1
rm -rf hmm33
mkdir hmm33
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm32/macros -H  hmm32/hmmdefs -M hmm33 monophones1
echo "Hmm 33 -p -5" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm33/macros -H hmm33/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p -5.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt
#echo "Hmm 33 -p 5" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm33/macros -H hmm33/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 5.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt
