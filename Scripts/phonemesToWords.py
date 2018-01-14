f = open('./beep-fixed', 'r')

# trialFile = open('./tr', 'w')

hindiDictionary = {}
for line in f.readlines():
	phonemicTranscription = ''
	for w in line.split()[1:]:
		phonemicTranscription = phonemicTranscription + w
	if phonemicTranscription not in hindiDictionary:
		hindiDictionary[phonemicTranscription] = []
	hindiDictionary[phonemicTranscription].append(line.split()[0])
	# trialFile.write(phonemicTranscription+" "+line.split()[0]+"\n")

f.close()
# trialFile.close()

f = open('./phonemeList', 'r')

phonemeList = []

for phone in f.readlines():
	phonemeList.append(phone[:-1])

wordsListExists = [0]*(len(phonemeList)+5)
listOfWords = [[] for p in range(len(phonemeList)+5)]

print phonemeList


for i in xrange(0, len(phonemeList)):
	for j in xrange(i, -1, -1):
		# print(str(i)+" "+str(j))
		newWord = ''
		for k in xrange(j, i+1):
			newWord = newWord + phonemeList[k]
		print(newWord)
		if (j-1 >= 0 and wordsListExists[j-1] == 1 and newWord in hindiDictionary):
			wordsListExists[i] = 1
			# wordList = listOfWords[j-1]
			# wordList.append(hindiDictionary[newWord])
			# listOfWords[i].append(wordList)
			for partialMatch in listOfWords[j-1]:
				for match in hindiDictionary[newWord]:
					st = partialMatch + " " + match
					listOfWords[i].append(st)
			# print("Found in first case")
			for t in listOfWords[i]:
				print(t)
				# print("\n")
		elif (j-1 < 0 and newWord in hindiDictionary):
			wordsListExists[i] = 1
			# wordList = []
			# wordList.append(hindiDictionary[newWord])
			# listOfWords[i].append(wordList)
			for match in hindiDictionary[newWord]:
				listOfWords[i].append(match)
			# print("Found in second case")
			for t in listOfWords[i]:
				print(t)
				# print("\n")
for i in xrange(0, len(phonemeList)):
	print str(wordsListExists[i])+" "

# print("\n")

for i in listOfWords[len(phonemeList)-1]:
	print(i)
	# print("\n")

f.close()

