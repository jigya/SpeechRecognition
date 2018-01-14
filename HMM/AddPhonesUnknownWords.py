def binarySearch(alist, item):
	first = 0
	last = len(alist)-1
	found = False
	while first<=last and not found:
		midpoint = (first + last)//2
		if alist[midpoint] == item:
			found = True
		else:
			if item < alist[midpoint]:
				last = midpoint-1
			else:
				first = midpoint+1
	return found	

import sys
sys.path.append('./')

import containers
import buckeye

uniquewords = {}

targetFile = open('./names', 'w')

for zipFileName in ('./s01.zip', './s02.zip', './s03.zip', './s04.zip', './s05.zip', './s06.zip', './s07.zip', './s08.zip', './s09.zip', './s10.zip', './s11.zip'):
	speaker = buckeye.Speaker(zipFileName)

	with open('./beep-fixed') as f:
		lines = f.readlines()

	beepwords = list()

	for x in lines[11:]:
		beepwords.append(x.split()[0])

	for track in speaker.tracks:
		wr = track.words[:]

		for x in wr:
			if "<" not in x.orthography and "{" not in x.orthography:
				if not x.orthography in uniquewords:
					if binarySearch(beepwords, x.orthography) == False:
						uniquewords[x.orthography] = x.phonemic

uniquewords["sent-end"] = "sil"
uniquewords["sent-start"] = "sil"

for spelling in sorted(uniquewords.iterkeys()):
	targetFile.write(spelling +"\t\t")
	if spelling!="sent-end" and spelling!="sent-start":
		for c in uniquewords[spelling]:
			targetFile.write(c+" ")
	else:
		targetFile.write("sil")
	targetFile.write("\n")
targetFile.close()
