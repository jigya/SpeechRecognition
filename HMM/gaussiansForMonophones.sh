rm -rf hmm10
mkdir hmm10
HHEd -A -D -T 1 -H hmm9/macros -H hmm9/hmmdefs -M hmm10 incMixtures.hed monophones1
echo "--------------------------------------------------------------------------------"
echo "hmm10 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm11
mkdir hmm11
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm10/macros -H hmm10/hmmdefs -M hmm11 monophones1
echo "--------------------------------------------------------------------------------"
echo "hmm11 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm12
mkdir hmm12
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm11/macros -H hmm11/hmmdefs -M hmm12 monophones1
echo "--------------------------------------------------------------------------------"
echo "hmm12 made!!"
echo "--------------------------------------------------------------------------------"
#echo "Hmm 12 -p -25" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm12/macros -H hmm12/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p -25.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt
rm -rf hmm13
mkdir hmm13
HHEd -A -D -T 1 -H hmm12/macros -H hmm12/hmmdefs -M hmm13 incMixtures2.hed monophones1 
echo "--------------------------------------------------------------------------------"
echo "hmm13 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm14
mkdir hmm14
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm13/macros -H hmm13/hmmdefs -M hmm14 monophones1
echo "--------------------------------------------------------------------------------"
echo "hmm14 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm15
mkdir hmm15
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm14/macros -H hmm14/hmmdefs -M hmm15 monophones1
echo
echo "--------------------------------------------------------------------------------"
echo "hmm15 made!!"
echo "--------------------------------------------------------------------------------"
#echo "Hmm 15 -p -25" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm15/macros -H hmm15/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p -25.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt

rm -rf hmm16
mkdir hmm16
HHEd -A -D -T 1 -H hmm15/macros -H hmm15/hmmdefs -M hmm16 incMixtures3.hed monophones1 
echo "--------------------------------------------------------------------------------"
echo "hmm16 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm17
mkdir hmm17
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm16/macros -H hmm16/hmmdefs -M hmm17 monophones1
echo "--------------------------------------------------------------------------------"
echo "hmm17 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm18
mkdir hmm18
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm17/macros -H hmm17/hmmdefs -M hmm18 monophones1
echo
echo "--------------------------------------------------------------------------------"
echo "hmm18 made!!"
echo "--------------------------------------------------------------------------------"
#echo "Hmm 18 -p -25" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm18/macros -H hmm18/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p -25.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt

rm -rf hmm19
mkdir hmm19
HHEd -A -D -T 1 -H hmm18/macros -H hmm18/hmmdefs -M hmm19 incMixtures4.hed monophones1 
echo "--------------------------------------------------------------------------------"
echo "hmm19 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm20
mkdir hmm20
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm19/macros -H hmm19/hmmdefs -M hmm20 monophones1
echo "--------------------------------------------------------------------------------"
echo "hmm20 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm21
mkdir hmm21
HERest -A -D -T 1 -C configHtk -I aligned.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm20/macros -H hmm20/hmmdefs -M hmm21 monophones1
echo
echo "--------------------------------------------------------------------------------"
echo "hmm21 made!!"
echo "--------------------------------------------------------------------------------"
echo "Hmm 21 -p -25" >> ./Results.txt
HVite -T 1 -C configHtk -H hmm21/macros -H hmm21/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p -25.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt
