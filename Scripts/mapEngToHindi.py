dictHindi = {}
mapFile = open('./mapEngToHindi','w')
fEnglish = open('./iiit_hin_sukh/etc/txt.done.data', 'r')
fHindi = open('./iiit_hin_sukh/etc/txt.done.data.utf8', 'r')
hindiSentences = fHindi.readlines()
englishSentences = fEnglish.readlines()
for idx in xrange(0, len(hindiSentences)):
	# print hindiSentences[idx].split('\"')
	hindiSentence = hindiSentences[idx]
	engSentence = englishSentences[idx]

	hindiSentence = hindiSentence.split('\"')[1]
	engSentence = engSentence.split('\"')[1]
	hindiSentence = hindiSentence.split()
	engSentence = engSentence.split()
	print engSentence, hindiSentence
	for p in xrange(0, min(len(engSentence), len(hindiSentence))):
		dictHindi[engSentence[p]] = hindiSentence[p].decode('utf8')

for key in dictHindi:
	mapFile.write(key+" "+dictHindi[key].encode('utf8')+"\n")

