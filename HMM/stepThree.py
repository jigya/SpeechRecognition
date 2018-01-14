import os
import subprocess

wordsPaths = []
labsPaths = []
monophones = []
total = 0
fileNamesFile = open("fileNames.txt", "r")
fileNames = fileNamesFile.readlines()
for fileName in fileNames:
	fileName = fileName[:-1]
	wordsPaths.append("words/" + fileName + ".words")
	labsPaths.append(fileName + ".lab")
	total += 1
print wordsPaths[0]
print "File Names read!!"
cmdLine = "rm words.mlf"
args = cmdLine.split()
popen = subprocess.call(args, stdout=subprocess.PIPE)
cmdLine = "touch words.mlf"
args = cmdLine.split()
popen = subprocess.call(args, stdout=subprocess.PIPE)
fileName="./words.mlf"
with open(fileName, "w") as myFile:
	myFile.write("#!MLF!#\n")
iterator = 0
for j in wordsPaths:
	with open(fileName, "a") as myFile:
		myFile.write("\"*/" + labsPaths[iterator] + "\"\n")
		with open(j, "r") as myFile2:
			myFile2Lines = myFile2.readlines()
			for myFile2Line in myFile2Lines:
				myFile.write(myFile2Line)
		myFile.write(".\n")
	iterator += 1
print "words.mlf made!!"
