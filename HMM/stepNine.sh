rm -rf hmm20
mkdir hmm20
HHEd -A -D -T 1 -H hmm19/macros -H hmm19/hmmdefs -M hmm20 incMixtures2.hed tiedlist 
echo "--------------------------------------------------------------------------------"
echo "hmm20 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm21
mkdir hmm21
rm -rf dir2
mkdir dir2
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames0.txt -H hmm20/macros -H hmm20/hmmdefs -M dir2 -p 1 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames1.txt -H hmm20/macros -H hmm20/hmmdefs -M dir2 -p 2 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames2.txt -H hmm20/macros -H hmm20/hmmdefs -M dir2 -p 3 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames3.txt -H hmm20/macros -H hmm20/hmmdefs -M dir2 -p 4 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames4.txt -H hmm20/macros -H hmm20/hmmdefs -M dir2 -p 5 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames5.txt -H hmm20/macros -H hmm20/hmmdefs -M dir2 -p 6 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames6.txt -H hmm20/macros -H hmm20/hmmdefs -M dir2 -p 7 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames7.txt -H hmm20/macros -H hmm20/hmmdefs -M dir2 -p 8 tiedlist
HERest -A -D -T 1 -p 0 -s stats -t 250.0 150.0 3000.0 -H hmm20/macros -H hmm20/hmmdefs -M hmm21 tiedlist dir2/HER1.acc dir2/HER2.acc dir2/HER3.acc dir2/HER4.acc dir2/HER5.acc dir2/HER6.acc dir2/HER7.acc dir2/HER8.acc
echo "--------------------------------------------------------------------------------"
echo "hmm21 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm22
mkdir hmm22
rm -rf dir2
mkdir dir2
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames0.txt -H hmm21/macros -H hmm21/hmmdefs -M dir2 -p 1 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames1.txt -H hmm21/macros -H hmm21/hmmdefs -M dir2 -p 2 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames2.txt -H hmm21/macros -H hmm21/hmmdefs -M dir2 -p 3 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames3.txt -H hmm21/macros -H hmm21/hmmdefs -M dir2 -p 4 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames4.txt -H hmm21/macros -H hmm21/hmmdefs -M dir2 -p 5 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames5.txt -H hmm21/macros -H hmm21/hmmdefs -M dir2 -p 6 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames6.txt -H hmm21/macros -H hmm21/hmmdefs -M dir2 -p 7 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames7.txt -H hmm21/macros -H hmm21/hmmdefs -M dir2 -p 8 tiedlist
HERest -A -D -T 1 -p 0 -s stats -t 250.0 150.0 3000.0 -H hmm21/macros -H hmm21/hmmdefs -M hmm22 tiedlist dir2/HER1.acc dir2/HER2.acc dir2/HER3.acc dir2/HER4.acc dir2/HER5.acc dir2/HER6.acc dir2/HER7.acc dir2/HER8.acc
echo "--------------------------------------------------------------------------------"
echo "hmm22 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm23
mkdir hmm23
rm -rf dir2
mkdir dir2
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames0.txt -H hmm22/macros -H hmm22/hmmdefs -M dir2 -p 1 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames1.txt -H hmm22/macros -H hmm22/hmmdefs -M dir2 -p 2 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames2.txt -H hmm22/macros -H hmm22/hmmdefs -M dir2 -p 3 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames3.txt -H hmm22/macros -H hmm22/hmmdefs -M dir2 -p 4 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames4.txt -H hmm22/macros -H hmm22/hmmdefs -M dir2 -p 5 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames5.txt -H hmm22/macros -H hmm22/hmmdefs -M dir2 -p 6 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames6.txt -H hmm22/macros -H hmm22/hmmdefs -M dir2 -p 7 tiedlist
HERest -A -D -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S fileNames7.txt -H hmm22/macros -H hmm22/hmmdefs -M dir2 -p 8 tiedlist
HERest -A -D -T 1 -p 0 -s stats -t 250.0 150.0 3000.0 -H hmm22/macros -H hmm22/hmmdefs -M hmm23 tiedlist dir2/HER1.acc dir2/HER2.acc dir2/HER3.acc dir2/HER4.acc dir2/HER5.acc dir2/HER6.acc dir2/HER7.acc dir2/HER8.acc
echo "--------------------------------------------------------------------------------"
echo "hmm23 made!!"
echo "--------------------------------------------------------------------------------"
#echo "Hmm 23 -p 20" >> ./Results.txt
#HVite -A -D -C configHtk -H hmm23/macros -H hmm23/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 20.0 -s 5.0 dict tiedlist && HResults -I testref.mlf tiedlist recout.mlf >> ./Results.txt
#echo "Hmm 23 -p 15" >> ./Results.txt
#HVite -C configHtk -H hmm23/macros -H hmm23/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 15.0 -s 5.0 dict tiedlist && HResults -I testref.mlf tiedlist recout.mlf >> ./Results.txt
#echo "Hmm 23 -p 10" >> ./Results.txt
#HVite -C configHtk -H hmm23/macros -H hmm23/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 10.0 -s 5.0 dict tiedlist && HResults -I testref.mlf tiedlist recout.mlf >> ./Results.txt
echo "Hmm 23 -p -5" >> ./Results.txt
HVite -T 1 -C configHtk -H hmm23/macros -H hmm23/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p -5.0 -s 5.0 dict tiedlist && HResults -I testref.mlf tiedlist recout.mlf >> ./Results.txt
