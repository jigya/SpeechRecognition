import random
fileNames = open("fileNames.txt","r")
lines = fileNames.readlines()
idx = 0
trainingFilePath = "./trainFileNames.txt"
codeTestScpPath = "./codetest.scp"
testScpPath = "./test.scp"
testRefMlfPath = "./testref.mlf"
toBeWritten = {}
d = 400
with open(testRefMlfPath, "a") as myfile:
	myfile.write("#!MLF!#\n")
for line in lines:
	randomNum = random.random()
	if (randomNum<0.9):
		with open(trainingFilePath, "a") as myfile:
			myfile.write("output" + str(idx) + "\n")
			toBeWritten[idx] = 1
			#toBeWritten[idx + 44 + 44] = 1
			#toBeWritten[idx + 44 + 44 + 44] = 1
			#toBeWritten[idx + 44 + 44 + 44 + 44] = 1
			#toBeWritten[idx + 44 + 44 + 44 + 44 + 44] = 1
			#toBeWritten[idx + 44 + 44 + 44 + 44 + 44 + 44] = 1
			#toBeWritten[idx + 44 + 44 + 44 + 44 + 44 + 44 + 44] = 1
	else:
		toBeWritten[idx] = 0
		#toBeWritten[idx + 44 + 44] = 0
		#toBeWritten[idx + 44 + 44 + 44] = 0
		#toBeWritten[idx + 44 + 44 + 44 + 44] = 0
		#toBeWritten[idx + 44 + 44 + 44 + 44 + 44] = 0
		#toBeWritten[idx + 44 + 44 + 44 + 44 + 44 + 44] = 0
		#toBeWritten[idx + 44 + 44 + 44 + 44 + 44 + 44 + 44] = 0
		with open(codeTestScpPath, "a") as myfile:
			myfile.write("audio/output" + str(idx) +".wav  testMfcc/output" + str(idx) + ".mfc\n")
		with open(testScpPath, "a") as myfile:
			myfile.write("testMfcc/output" + str(idx) + ".mfc\n")
		with open(testRefMlfPath, "a") as myfile:
			myfile.write("\"*/output" + str(idx) + ".lab\"\n")
			wordsFile = open("./words/output" + str(idx) + ".words", "r")
			wordLines = wordsFile.readlines()
			for wordLine in wordLines:
				myfile.write(wordLine)
			myfile.write(".\n")
	idx += 1
	if idx == d+1:
		break
idx = 0
while (idx < 1):
	for index in xrange(d):
		if (toBeWritten[index] == 1):
			with open(trainingFilePath, "a") as myfile:
				myfile.write("output" + str(index) + "\n")
	idx += 1
