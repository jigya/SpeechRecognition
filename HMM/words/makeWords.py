mapper = {}
wordsFile = open("txt.done.data", "r")
i = 1
for line in wordsFile:
	line = line.split('"')
	printLine = line[1][1:]
	printLine = printLine[:-1]
	writeFileName = "output" + str(i) + ".words"
	myFile = open(writeFileName, "w")
	printWords = printLine.split(' ')
	for word in printWords:
		myFile.write(word + "\n")
	i += 1
