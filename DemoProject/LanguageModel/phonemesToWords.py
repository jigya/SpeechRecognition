import os
import subprocess

f = open('./beep-fixed', 'r')

hindiDictionary = {}
for line in f.readlines():
	phonemicTranscription = ''
	for w in line.split()[1:]:
		phonemicTranscription = phonemicTranscription + w
	if phonemicTranscription not in hindiDictionary:
		hindiDictionary[phonemicTranscription] = []
	hindiDictionary[phonemicTranscription].append(line.split()[0])

f.close()

for phonemeFile in os.listdir('./PhoneList'):
	if phonemeFile == '.DS_Store':
		continue
	f = open('./PhoneList/'+phonemeFile, 'r')
	idx = int(phonemeFile[8:])	
	phonemeList = []	
	for phone in f.readlines():
		phonemeList.append(phone[:-1])	
	wordsListExists = [0]*(len(phonemeList)+5)
	listOfWords = [[] for p in range(len(phonemeList)+5)]	
	for i in xrange(0, len(phonemeList)):
		for j in xrange(i, -1, -1):
			newWord = ''
			for k in xrange(j, i+1):
				newWord = newWord + phonemeList[k]
			if (j-1 >= 0 and wordsListExists[j-1] == 1 and newWord in hindiDictionary):
				wordsListExists[i] = 1
				for partialMatch in listOfWords[j-1]:
					for match in hindiDictionary[newWord]:
						st = partialMatch + " " + match
						listOfWords[i].append(st)
			elif (j-1 < 0 and newWord in hindiDictionary):
				wordsListExists[i] = 1
				for match in hindiDictionary[newWord]:
					listOfWords[i].append(match)
	outputFile = open('./PossibleSentences/output'+str(idx),'w')
	for i in listOfWords[len(phonemeList)-1]:
		outputFile.write(i+"\n")
	f.close()
	outputFile.close()

	outputProbPath = "./PossibleSentences/outputprob"+str(idx)
	outfile = open(outputProbPath, 'w')

	langModelCmd = "../srilm-1.7.1/bin/macosx/ngram -lm langmodel -ppl "+"./PossibleSentences/output"+str(idx)+" -debug 1"
	args = langModelCmd.split()
	subprocess.call(args, stdout = outfile)
	outfile.close()


