import zipfile
import glob
import os
import sys
sys.path.append('../buckeye-master')

import containers
import buckeye


for zipped in glob.glob('*.zip'):
	with zipfile.ZipFile(zipped, "r") as z:
		z.extractall()
		folderName = zipped.split('.')[0]
		subFolderName = './'+folderName
		for x in os.listdir(subFolderName):
			print x
			subFilePath = subFolderName+'/'+x
			with zipfile.ZipFile(subFilePath, "r") as y:
				y.extractall(subFolderName+'/'+x.split('.')[0])
	# 			subSpeakerFilePath = subFolderName+'/'+x.split('.')[0]
	# 			print subSpeakerFilePath
	# 			splitFilePath = subSpeakerFilePath+'/'+'SplitFiles'
				# if not os.path.exists(splitFilePath):
				# 	os.makedirs(splitFilePath)
	# 			targetFile = open(splitFilePath+'/startEndTime', 'w')
	# 			with open(subSpeakerFilePath+'/'+x.split('.')[0]+'.words') as f:
	# 				lines = f.readlines()
	# 			start = 1
	# 			idx = 0
	# 			while idx < len(lines) and '#' not in lines[idx]:
	# 				idx = idx+1
	# 			idx = idx+1
	# 			while idx < len(lines):
	# 				# print lines[idx]
	# 				while (idx < len(lines)) and ("<" in lines[idx] or "{" in lines[idx]):
	# 					idx = idx+1
	# 				if idx < len(lines):
	# 					startLine = lines[idx-1]
	# 					while (idx < len(lines)) and ("<" not in lines[idx] and "{" not in lines[idx]):
	# 						idx = idx+1
	# 					endLine = lines[idx-1]
	# 					startTime = startLine.split()[0]
	# 					endTime = endLine.split()[0]
	# 					targetFile.write(startTime+" "+endTime)
	# 					# print startTime+" "+endTime
	# 					targetFile.write("\n")
	# 			targetFile.close()

				# idx = 0
				# start = 0	
				# while idx < len(lines) and "#" not in lines[idx]:
				# 	idx = idx+1
				# idx = idx+1

				# while idx < len(lines):
				# 	while (idx < len(lines)) and ("<" in lines[idx] or "{" in lines[idx]):
				# 		idx = idx+1
				# 	if idx < len(lines):
				# 		wordFilePath = splitFilePath+'/output'+str(start)+".words"
				# 		phoneFilePath = splitFilePath+'/output'+str(start)+".phones"
				# 		start = start+1
				# 		wordFile = open(wordFilePath, 'w')
				# 		phoneFile = open(phoneFilePath, 'w')
				# 		while (idx < len(lines)) and ("<" not in lines[idx] and "{" not in lines[idx]):
				# 			wordFile.write(lines[idx].split()[2][:-1].upper())
				# 			wordFile.write("\n")
				# 			for y in lines[idx].split(';')[2].split():
				# 				phoneFile.write(y)
				# 			idx = idx+1
				# 		wordFile.close()
				# 		phoneFile.close()

	# # Split wave files
	# speaker = buckeye.Speaker(zipped, load_wavs = True)
	# for idx, track in enumerate(speaker):
	# 	with open(speaker.name+'/'+track.name+'/SplitFiles'+'/startEndTime', 'r') as f:
	# 		lines = f.readlines()
	# 	for idx, x in enumerate(lines):
	# 		startTime = float(x.split()[0])
	# 		endTime = float(x.split()[1])
	# 		# print startTime, endTime
	# 		wavFilePath = speaker.name+'/'+track.name+'/SplitFiles/'+"output"+str(idx)+".wav"
	# 		track.clip_wav(wavFilePath, startTime, endTime)









