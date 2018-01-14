rm -rf hmm13
mkdir hmm13
HHEd -A -D -T 1 -H hmm12/macros -H hmm12/hmmdefs -M hmm13 tree.hed triphones1 
echo "--------------------------------------------------------------------------------"
echo "hmm13 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm14
mkdir hmm14
rm -rf dir2
mkdir dir2
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames0.txt -H hmm13/macros -H hmm13/hmmdefs -M dir2 -p 1 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames1.txt -H hmm13/macros -H hmm13/hmmdefs -M dir2 -p 2 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames2.txt -H hmm13/macros -H hmm13/hmmdefs -M dir2 -p 3 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames3.txt -H hmm13/macros -H hmm13/hmmdefs -M dir2 -p 4 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames4.txt -H hmm13/macros -H hmm13/hmmdefs -M dir2 -p 5 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames5.txt -H hmm13/macros -H hmm13/hmmdefs -M dir2 -p 6 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames6.txt -H hmm13/macros -H hmm13/hmmdefs -M dir2 -p 7 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames7.txt -H hmm13/macros -H hmm13/hmmdefs -M dir2 -p 8 tiedlist
HERest -A -D -T 1 -p 0 -s stats -t 250.0 150.0 3000.0 -H hmm13/macros -H hmm13/hmmdefs -M hmm14 tiedlist dir2/HER1.acc dir2/HER2.acc dir2/HER3.acc dir2/HER4.acc dir2/HER5.acc dir2/HER6.acc dir2/HER7.acc dir2/HER8.acc
echo "--------------------------------------------------------------------------------"
echo "hmm14 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm15
mkdir hmm15
rm -rf dir2
mkdir dir2
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames0.txt -H hmm14/macros -H hmm14/hmmdefs -M dir2 -p 1 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames1.txt -H hmm14/macros -H hmm14/hmmdefs -M dir2 -p 2 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames2.txt -H hmm14/macros -H hmm14/hmmdefs -M dir2 -p 3 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames3.txt -H hmm14/macros -H hmm14/hmmdefs -M dir2 -p 4 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames4.txt -H hmm14/macros -H hmm14/hmmdefs -M dir2 -p 5 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames5.txt -H hmm14/macros -H hmm14/hmmdefs -M dir2 -p 6 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames6.txt -H hmm14/macros -H hmm14/hmmdefs -M dir2 -p 7 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames7.txt -H hmm14/macros -H hmm14/hmmdefs -M dir2 -p 8 tiedlist
HERest -A -D -T 1 -p 0 -s stats -t 250.0 150.0 3000.0 -H hmm14/macros -H hmm14/hmmdefs -M hmm15 tiedlist dir2/HER1.acc dir2/HER2.acc dir2/HER3.acc dir2/HER4.acc dir2/HER5.acc dir2/HER6.acc dir2/HER7.acc dir2/HER8.acc
echo "--------------------------------------------------------------------------------"
echo "hmm15 made!!"
echo "--------------------------------------------------------------------------------"
echo "Hmm 15 -p 20" > ./Results.txt
HVite -C configHtk -H hmm15/macros -H hmm15/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 20.0 -s 5.0 dict tiedlist && HResults -I testref.mlf tiedlist recout.mlf >> ./Results.txt
echo "Hmm 15 -p 15" >> ./Results.txt
HVite -C configHtk -H hmm15/macros -H hmm15/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 15.0 -s 5.0 dict tiedlist && HResults -I testref.mlf tiedlist recout.mlf >> ./Results.txt
echo "Hmm 15 -p 10" >> ./Results.txt
HVite -C configHtk -H hmm15/macros -H hmm15/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 10.0 -s 5.0 dict tiedlist && HResults -I testref.mlf tiedlist recout.mlf >> ./Results.txt
echo "Hmm 15 -p 5" >> ./Results.txt
HVite -C configHtk -H hmm15/macros -H hmm15/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 5.0 -s 5.0 dict tiedlist && HResults -I testref.mlf tiedlist recout.mlf >> ./Results.txt
