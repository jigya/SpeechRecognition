rm -rf hmm34
mkdir hmm34
HHEd -A -D -T 1 -H hmm33/macros -H hmm33/hmmdefs -M hmm34 incMixtures7.hed monophones1
rm -rf hmm35
mkdir hmm35
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm34/macros -H  hmm34/hmmdefs -M hmm35 monophones1
rm -rf hmm36
mkdir hmm36
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm35/macros -H  hmm35/hmmdefs -M hmm36 monophones1
rm -rf hmm37
mkdir hmm37
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm36/macros -H  hmm36/hmmdefs -M hmm37 monophones1
echo "Hmm 37 -p -5" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm37/macros -H hmm37/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p -5.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt

rm -rf hmm38
mkdir hmm38
HHEd -A -D -T 1 -H hmm37/macros -H hmm37/hmmdefs -M hmm38 incMixtures8.hed monophones1
rm -rf hmm39
mkdir hmm39
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm38/macros -H  hmm38/hmmdefs -M hmm39 monophones1
rm -rf hmm40
mkdir hmm40
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm39/macros -H  hmm39/hmmdefs -M hmm40 monophones1
rm -rf hmm41
mkdir hmm41
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm40/macros -H  hmm40/hmmdefs -M hmm41 monophones1
echo "Hmm 41 -p -5" >> ./Results.txt
#HVite -T 1 -C configHtk -H hmm41/macros -H hmm41/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p -5.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt

rm -rf hmm42
mkdir hmm42
HHEd -A -D -T 1 -H hmm41/macros -H hmm41/hmmdefs -M hmm42 incMixtures9.hed monophones1
rm -rf hmm43
mkdir hmm43
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm42/macros -H  hmm42/hmmdefs -M hmm43 monophones1
rm -rf hmm44
mkdir hmm44
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm43/macros -H  hmm43/hmmdefs -M hmm44 monophones1
rm -rf hmm45
mkdir hmm45
HERest -A -D -T 1 -C configHtk  -I phones1.mlf -t 250.0 150.0 3000.0 -S train.scp -H hmm44/macros -H  hmm44/hmmdefs -M hmm45 monophones1
echo "Hmm 45 -p -25" >> ./Results.txt
HVite -T 1 -C configHtk -H hmm45/macros -H hmm45/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p -25.0 -s 2.5 dict monophones1 && HResults -I testref.mlf monophones1 recout.mlf >> ./Results.txt
