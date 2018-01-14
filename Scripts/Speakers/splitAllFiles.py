import sys
sys.path.append('../buckeye-master')

import containers
import buckeye
import os

corpus = buckeye.corpus('../speakers/', load_wavs = True)

currIndex = 0
currIndex2 = 0
for speaker in corpus:
	start = 0
	splitFilePath = './SplitFiles'
	if not os.path.exists(splitFilePath):
		os.makedirs(splitFilePath)
	audioFolder = splitFilePath + '/Audio'
	wordFolder = splitFilePath + '/Words'
	phoneFolder = splitFilePath + '/Phones'
	if not os.path.exists(audioFolder):
		os.makedirs(audioFolder)	
	if not os.path.exists(wordFolder):
		os.makedirs(wordFolder)
	if not os.path.exists(phoneFolder):
		os.makedirs(phoneFolder)	
	for track in speaker:
		trackPath = './'+speaker.name+'/'+track.name
		targetFile = open(trackPath+'/startEndTime', 'w')
		with open(trackPath+'/'+track.name+'.words') as f:
			lines = f.readlines()
		# print trackPath+'/'+track.name+'.words'
		# idx = 0
		# while idx < len(lines) and '#' not in lines[idx]:
		# 	idx = idx+1
		# idx = idx+1
		# while idx < len(lines):
		# 	# print lines[idx]
		# 	while (idx < len(lines)) and ("<" in lines[idx] or "{" in lines[idx]):
		# 		idx = idx+1
		# 	if idx < len(lines):
		# 		startLine = lines[idx-1]
		# 		while (idx < len(lines)) and ("<" not in lines[idx] and "{" not in lines[idx]):
		# 			idx = idx+1
		# 		endLine = lines[idx-1]
		# 		startTime = startLine.split()[0]
		# 		endTime = endLine.split()[0]
		# 		targetFile.write(startTime+" "+endTime)
		# 		# print startTime+" "+endTime
		# 		targetFile.write("\n")
		# targetFile.close()

		idx = 0
		while idx < len(lines) and "#" not in lines[idx]:
			idx = idx+1
		idx = idx+1

		while idx < len(lines):
			while (idx < len(lines)) and ("<" in lines[idx] or "{" in lines[idx]):
				idx = idx+1
			if idx < len(lines):
				startLine = lines[idx-1]
				wordFilePath = wordFolder+'/'+speaker.name+'-output'+str(currIndex)+".words"
				phoneFilePath = phoneFolder+'/'+speaker.name+'-output'+str(currIndex)+".phones"
				wavFilePath = audioFolder+'/'+speaker.name+'-output'+str(currIndex)+".wav"
				wordFile = open(wordFilePath, 'w')
				phoneFile = open(phoneFilePath, 'w')
				while (idx < len(lines)) and ("<" not in lines[idx] and "{" not in lines[idx]):
					wordFile.write(lines[idx].split()[2][:-1].upper())
					wordFile.write("\n")
					for y in lines[idx].split(';')[2].split():
						phoneFile.write(y+'\n')
					idx = idx+1
				endLine = lines[idx-1]
				startTime = float(startLine.split()[0])
				endTime = float(endLine.split()[0])
				if endTime - startTime > 0.4:
					track.clip_wav(wavFilePath, startTime, endTime)
					currIndex = currIndex+1
				wordFile.close()
				phoneFile.close()
				

		# with open(trackPath+'/startEndTime', 'r') as f:
		# 	lines = f.readlines()
		# for x in lines:
		# 	startTime = float(x.split()[0])
		# 	endTime = float(x.split()[1])
		# 	wavFilePath = audioFolder+'/output'+str(currIndex2)+".wav"
		# 	currIndex2 = currIndex2+1
		# 	track.clip_wav(wavFilePath, startTime, endTime)


