rm -rf hmm24
mkdir hmm24
HHEd -A -D -T 1 -H hmm23/macros -H hmm23/hmmdefs -M hmm24 incMixtures3.hed tiedlist 
echo "--------------------------------------------------------------------------------"
echo "hmm20 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm25
mkdir hmm25
HERest -A -D -T 1 -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S train.scp -H hmm24/macros -H hmm24/hmmdefs -M hmm25 tiedlist
echo "--------------------------------------------------------------------------------"
echo "hmm21 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm26
mkdir hmm26
HERest -A -D -T 1 -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S train.scp -H hmm25/macros -H hmm25/hmmdefs -M hmm26 tiedlist
echo "--------------------------------------------------------------------------------"
echo "hmm22 made!!"
echo "--------------------------------------------------------------------------------"
rm -rf hmm27
mkdir hmm27
HERest -A -D -T 1 -T 1 -C configHtk -I wintri.mlf -s stats -t 250.0 150.0 3000.0 -S train.scp -H hmm26/macros -H hmm26/hmmdefs -M hmm27 tiedlist
echo "--------------------------------------------------------------------------------"
echo "hmm27 made!!"
echo "--------------------------------------------------------------------------------"
#echo "Hmm 27 -p 20" >> ./Results.txt
#HVite -C configHtk -H hmm27/macros -H hmm27/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 20.0 -s 5.0 dict tiedlist && HResults -I testref.mlf tiedlist recout.mlf >> ./Results.txt
#echo "Hmm 27 -p 15" >> ./Results.txt
#HVite -C configHtk -H hmm27/macros -H hmm27/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 15.0 -s 5.0 dict tiedlist && HResults -I testref.mlf tiedlist recout.mlf >> ./Results.txt
#echo "Hmm 27 -p 10" >> ./Results.txt
#HVite -C configHtk -H hmm27/macros -H hmm27/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p 10.0 -s 5.0 dict tiedlist && HResults -I testref.mlf tiedlist recout.mlf >> ./Results.txt
echo "Hmm 27 -p -25" >> ./Results.txt
HVite -C configHtk -H hmm27/macros -H hmm27/hmmdefs -S test.scp -l '*' -i recout.mlf -w wdnet -p -25.0 -s 5.0 dict tiedlist && HResults -I testref.mlf tiedlist recout.mlf >> ./Results.txt
