mapper = {}
for i in xrange(1000):
	if i < 9:
		fileName = "hin_000" + str(i+1) + ".lab"
	elif i < 99:
		fileName = "hin_00" + str(i+1) + ".lab"
	elif i < 999:
		fileName = "hin_0" + str(i+1) + ".lab"
	else:
		fileName = "hin_" + str(i+1) + ".lab"
	labFile = open(fileName, "r")
	phonesFileName = "output" + str(i+1) + ".phones"
	phonesFile = open(phonesFileName, "w")
	labFileContents = labFile.readlines()
	firstLineSkipped = False
	for line in labFileContents:
		if firstLineSkipped == False:
			firstLineSkipped = True
		else:
			lineParts = line.split(' ')
			print lineParts
			if lineParts[2] in mapper:
				phonesFile.write(lineParts[2].lower())
			else:
				mapper[lineParts[2]] = 1
				phonesFile.write(lineParts[2].lower())
	labFile.close()
	phonesFile.close()
print mapper.keys()
outputFile = open("./phoneList", "w")
for key in mapper.keys():
	outputFile.write(key)
