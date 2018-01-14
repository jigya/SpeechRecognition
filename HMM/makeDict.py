dictionary = {}
for i in xrange(1000):
	#print "-------------------------" + str(i+1) + "-----------------------"
	phonesList = []
	wordsList = []
	phonesFileName = "phones/output" + str(i+1) + ".phones"
	wordsFileName = "words/output" + str(i+1) + ".words"
	phonesFile = open(phonesFileName, "r")
	wordsFile = open(wordsFileName, "r")
	phonesFileContents = phonesFile.readlines()
	wordsFileContents = wordsFile.readlines()
	for line in phonesFileContents:
		line = line[:-1]
		phonesList.append(line)
	for line in wordsFileContents:
		line = line[:-1]
		wordsList.append(line)
	#print phonesList
	#print wordsList
	phonesListCounter = 0
	wordsListCounter = 0
	while wordsListCounter < len(wordsList):
		phonemicTranscription = []
		wordInQuestion = wordsList[wordsListCounter]
		wordMadeUp = ""
		while wordInQuestion.startswith(phonesList[phonesListCounter]) == False:
			phonesListCounter += 1
		#print phonesListCounter
		while wordMadeUp != wordInQuestion:
			wordMadeUp += phonesList[phonesListCounter]
			phonemicTranscription.append(phonesList[phonesListCounter])
			phonesListCounter += 1
		#print wordMadeUp
		dictionary[wordInQuestion] = phonemicTranscription
		wordsListCounter += 1
		#print phonesListCounter
outputFile = open("beep-fixed", "w")
for key in sorted(dictionary):
	outputFile.write(key + "\t")
	for phoneme in dictionary[key]:
		outputFile.write(" " + phoneme)
	outputFile.write("\n")
