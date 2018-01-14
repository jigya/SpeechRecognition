#Used to create input file for language model for phones

import glob, os

pathLabFile = "./iiit_hin_sukh/lab"

phoneLang = open("./phoneLang.txt", "w")

for labfile in os.listdir(pathLabFile):
	if labfile.endswith(".lab"):
		phoneLang.write("<s> ")
		f = open(pathLabFile + "/" + labfile, "r")
		for line in f.readlines()[1:]:
			phoneLang.write(line.split()[2]+" ")
		phoneLang.write("</s>\n")
		f.close()

phoneLang.close()