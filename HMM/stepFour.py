import os
import subprocess

mfccPaths = []
audioPaths = []
monophones = []
total = 0
fileNamesFile = open("fileNames.txt", "r")
fileNames = fileNamesFile.readlines()
for fileName in fileNames:
	fileName = fileName[:-1]
	mfccPaths.append("mfcc/" + fileName + ".mfc")
	audioPaths.append("audio/" + fileName + ".wav")
	total += 1
print mfccPaths[0]
monophonesFile = open("monophones0", "r")
monophonesWithNewLine = monophonesFile.readlines()
for monop in monophonesWithNewLine:
	monop = monop[:-1]
	monophones.append(monop)
hmm0Dir = "hmm0/"
protoName = "proto"
vFloorsName = "vFloors"
tempName = "temp"
hmmDefsName = "hmmdefs"
macroName = "macros"
protoPath = hmm0Dir + protoName
vFloorsPath = hmm0Dir + vFloorsName
tempPath = hmm0Dir + tempName
hmmDefsPath = hmm0Dir + hmmDefsName
macroPath = hmm0Dir + macroName
print "FileNames Read!!"
cmdLine = "rm codetr.scp"
args = cmdLine.split()
popen = subprocess.call(args, stdout=subprocess.PIPE)
cmdLine = "touch codetr.scp"
args = cmdLine.split()
popen = subprocess.call(args, stdout=subprocess.PIPE)
fileName="./codetr.scp"
iterator = 0
for iterator in xrange(total):
	with open(fileName, "a") as myFile:
		myFile.write(audioPaths[iterator] + " " + mfccPaths[iterator] + "\n")
print "codeTr.scp Made!!"
cmdLine = "HCopy -T 1 -C config -S codetr.scp"
args = cmdLine.split()
popen = subprocess.call(args)
print "MFCCs made!!"
cmdLine = "rm train.scp"
args = cmdLine.split()
popen = subprocess.call(args, stdout=subprocess.PIPE)
cmdLine = "touch train.scp"
args = cmdLine.split()
popen = subprocess.call(args, stdout=subprocess.PIPE)
fileName="./train.scp"
iterator = 0
for iterator in xrange(total):
	with open(fileName, "a") as myFile:
		myFile.write(mfccPaths[iterator] + "\n")
print "train.scp made!!"
cmdLine = "rm -rf hmm0"
args = cmdLine.split()
popen = subprocess.call(args, stdout=subprocess.PIPE)
cmdLine = "mkdir hmm0"
args = cmdLine.split()
popen = subprocess.call(args, stdout=subprocess.PIPE)
cmdLine = "HCompV -A -D -T 1 -C configHtk -f 0.01 -m -S train.scp -M hmm0 proto"
args = cmdLine.split()
popen = subprocess.call(args, stdout=subprocess.PIPE)
print "hmm0 made with prototype!!"
