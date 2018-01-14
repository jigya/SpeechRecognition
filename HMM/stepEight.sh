rm -rf hmm16
mkdir hmm16
HHEd -A -D -T 1 -H hmm15/macros -H hmm15/hmmdefs -M hmm16 incMixtures.hed tiedlist 
echo "--------------------------------------------------------------------------------"
echo "hmm16 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm17
mkdir hmm17
rm -rf dir2
mkdir dir2
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames0.txt -H hmm16/macros -H hmm16/hmmdefs -M dir2 -p 1 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames1.txt -H hmm16/macros -H hmm16/hmmdefs -M dir2 -p 2 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames2.txt -H hmm16/macros -H hmm16/hmmdefs -M dir2 -p 3 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames3.txt -H hmm16/macros -H hmm16/hmmdefs -M dir2 -p 4 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames4.txt -H hmm16/macros -H hmm16/hmmdefs -M dir2 -p 5 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames5.txt -H hmm16/macros -H hmm16/hmmdefs -M dir2 -p 6 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames6.txt -H hmm16/macros -H hmm16/hmmdefs -M dir2 -p 7 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames7.txt -H hmm16/macros -H hmm16/hmmdefs -M dir2 -p 8 tiedlist
HERest -A -D -T 1 -p 0 -s stats -t 250.0 150.0 3000.0 -H hmm16/macros -H hmm16/hmmdefs -M hmm17 tiedlist dir2/HER1.acc dir2/HER2.acc dir2/HER3.acc dir2/HER4.acc dir2/HER5.acc dir2/HER6.acc dir2/HER7.acc dir2/HER8.acc
echo "--------------------------------------------------------------------------------"
echo "hmm17 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm18
mkdir hmm18
rm -rf dir2
mkdir dir2
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames0.txt -H hmm17/macros -H hmm17/hmmdefs -M dir2 -p 1 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames1.txt -H hmm17/macros -H hmm17/hmmdefs -M dir2 -p 2 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames2.txt -H hmm17/macros -H hmm17/hmmdefs -M dir2 -p 3 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames3.txt -H hmm17/macros -H hmm17/hmmdefs -M dir2 -p 4 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames4.txt -H hmm17/macros -H hmm17/hmmdefs -M dir2 -p 5 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames5.txt -H hmm17/macros -H hmm17/hmmdefs -M dir2 -p 6 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames6.txt -H hmm17/macros -H hmm17/hmmdefs -M dir2 -p 7 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames7.txt -H hmm17/macros -H hmm17/hmmdefs -M dir2 -p 8 tiedlist
HERest -A -D -T 1 -p 0 -s stats -t 250.0 150.0 3000.0 -H hmm17/macros -H hmm17/hmmdefs -M hmm18 tiedlist dir2/HER1.acc dir2/HER2.acc dir2/HER3.acc dir2/HER4.acc dir2/HER5.acc dir2/HER6.acc dir2/HER7.acc dir2/HER8.acc
echo "--------------------------------------------------------------------------------"
echo "hmm18 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm19
mkdir hmm19
rm -rf dir2
mkdir dir2
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames0.txt -H hmm18/macros -H hmm18/hmmdefs -M dir2 -p 1 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames1.txt -H hmm18/macros -H hmm18/hmmdefs -M dir2 -p 2 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames2.txt -H hmm18/macros -H hmm18/hmmdefs -M dir2 -p 3 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames3.txt -H hmm18/macros -H hmm18/hmmdefs -M dir2 -p 4 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames4.txt -H hmm18/macros -H hmm18/hmmdefs -M dir2 -p 5 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames5.txt -H hmm18/macros -H hmm18/hmmdefs -M dir2 -p 6 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames6.txt -H hmm18/macros -H hmm18/hmmdefs -M dir2 -p 7 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames7.txt -H hmm18/macros -H hmm18/hmmdefs -M dir2 -p 8 tiedlist
HERest -A -D -T 1 -p 0 -s stats -t 250.0 150.0 3000.0 -H hmm18/macros -H hmm18/hmmdefs -M hmm19 tiedlist dir2/HER1.acc dir2/HER2.acc dir2/HER3.acc dir2/HER4.acc dir2/HER5.acc dir2/HER6.acc dir2/HER7.acc dir2/HER8.acc
echo "--------------------------------------------------------------------------------"
echo "hmm19 made!!"
echo "--------------------------------------------------------------------------------"
#echo "Hmm 19 -p 20" >> ./Results.txt
#HVite -C configHtk -H hmm19/macros -H hmm19/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 20.0 -s 5.0 dict tiedlist && HResults -I testref.mlf tiedlist recout.mlf >> ./Results.txt
#echo "Hmm 19 -p 15" >> ./Results.txt
#HVite -C configHtk -H hmm19/macros -H hmm19/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 15.0 -s 5.0 dict tiedlist && HResults -I testref.mlf tiedlist recout.mlf >> ./Results.txt
#echo "Hmm 19 -p 10" >> ./Results.txt
#HVite -C configHtk -H hmm19/macros -H hmm19/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 10.0 -s 5.0 dict tiedlist && HResults -I testref.mlf tiedlist recout.mlf >> ./Results.txt
echo "Hmm 19 -p -25" >> ./Results.txt
HVite -T 1 -C configHtk -H hmm19/macros -H hmm19/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 25.0 -s 5.0 dict tiedlist && HResults -I testref.mlf tiedlist recout.mlf >> ./Results.txt
