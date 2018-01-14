#extract the uttterances from the stm files

import wave
import re
import os
import subprocess

def clip_wav(wav, clip, beg, end):
	framerate = wav.getframerate()
	length = end - beg

	frames = int(round(length * framerate))
	beg_frame = int(round(beg * framerate))

	wav_out = wave.open(clip, 'wb')

	wav_out.setparams(wav.getparams())
	wav.setpos(beg_frame)
	wav_out.writeframes(wav.readframes(frames))

	wav_out.close()	



if not os.path.exists('./TedLiumFiles'):
	os.makedirs('./TedLiumFiles')

if not os.path.exists('./TedLiumFiles/train'):
	os.makedirs('./TedLiumFiles/train')

if not os.path.exists('./TedLiumFiles/train/WavFiles'):
	os.makedirs('./TedLiumFiles/train/WavFiles')

# pathOfSphFiles = '../kaldi-trunk/egs/tedlium/s5/db/TEDLIUM_release2/train/sph'

# for i in os.listdir(pathOfSphFiles):
# 	if i.endswith(".sph"):
# 		cmdLine = "../kaldi-trunk/tools/sph2pipe_v2.5/sph2pipe -f wav "+pathOfSphFiles+"/"+i+" "+"./TedLiumFiles/train/WavFiles/"+i.split('.')[0]+".wav"
# 		print cmdLine
# 		args = cmdLine.split()
# 		popen = subprocess.call(args, stdout=subprocess.PIPE)


if not os.path.exists('./TedLiumFiles/train/audio'):
	os.makedirs('./TedLiumFiles/train/audio')

if not os.path.exists('./TedLiumFiles/train/phones'):
	os.makedirs('./TedLiumFiles/train/phones')

if not os.path.exists('./TedLiumFiles/train/words'):
	os.makedirs('./TedLiumFiles/train/words')	

with open('../kaldi-trunk/egs/tedlium/s5/db/TEDLIUM_release1/TEDLIUM.150k.dic', 'r') as f:
	lines = f.readlines()

dictwords = {}

for x in lines:
	sp = x.split()
	dictwords[sp[0]] = sp[1:]
	# print sp[0], dictwords[sp[0]]

with open('../kaldi-trunk/egs/tedlium/s5/db/extra.dic', 'r') as f:
	lines = f.readlines()

for x in lines:
	sp = x.split()
	dictwords[sp[0]] = sp[1:]

#extract the utterance

expr = ".*<.*,.*,(male|female)> *(.*)[(][A-Z].*[)]"
# expr = ".*<.*,.*,(male|female)> *(.*)"

dataPattern = re.compile(expr)

targetFile = open('./utterances', 'w')

logFile = open('./splittinglog', 'w')

currIndex = 0

numFiles = 0

for p in os.listdir("../kaldi-trunk/egs/tedlium/s5/db/TEDLIUM_release1/train/stm"):
	# numFiles = numFiles+1
	# if numFiles > 350:
	# 	break
	print p
	f = open('../kaldi-trunk/egs/tedlium/s5/db/TEDLIUM_release1/train/stm/'+p, 'r')
	origAudio = wave.open('./TedLiumFiles/train/WavFiles/'+p.split('.')[0]+'.wav','r')	

	audioFolderPath = './TedLiumFiles/train/audio'
	phoneFolderPath = './TedLiumFiles/train/phones'
	wordFolderPath = './TedLiumFiles/train/words'	

	for i in f.readlines():
		audioFilePath = audioFolderPath+'/output'+str(currIndex)+'.wav'
		phoneFilePath = phoneFolderPath+'/output'+str(currIndex)+'.phones'
		wordFilePath = wordFolderPath+'/output'+str(currIndex)+'.words'	

		#write audio file
		startTime = float(i.split()[3])
		endTime = float(i.split()[4])
		# clip_wav(origAudio, audioFilePath, startTime, endTime)	

		#write words and phone files
		wordFile = open(wordFilePath,'w')
		phoneFile = open(phoneFilePath, 'w')	

		match = dataPattern.match(i)
		if match:
			m = match.group(2)
			m = re.sub('{.*?}', '', m)
			m = re.sub('<.*?>', '', m)
			m = re.sub('[(][0-9][)]', '', m)
			m = re.sub(' +', ' ', m)
			m = re.sub(' (?=\')', '', m)
			targetFile.write(m+"\n")
			word_list = m.split()
			for word in word_list:
				# if word.count('\'') >= 2:
				# 	print "yha problem hai ---------------------------------"+word
				if word in dictwords:
					if word[0] == '\'':
						wordFile.write('\\')
					wordFile.write(word.split('(')[0]+"\n")
					for phone in dictwords[word]:
						phoneFile.write(phone+"\n")
				elif word.count('\'') == 1:
					firstpart = word.split('\'')[0]
					secondpart = word.split('\'')[1]
					if secondpart == '':
						subWord = firstpart[:-1]
						if subWord in dictwords:
							wordFile.write(subWord+"\n")
							for phone in dictwords[subWord]:
								phoneFile.write(phone+"\n") 
					elif firstpart in dictwords and ('\''+secondpart) in dictwords:
						wordFile.write(firstpart.split('(')[0]+"\n")
						for phone in dictwords[firstpart]:
							phoneFile.write(phone+"\n")
						wordFile.write('\\\'')
						wordFile.write(secondpart.split('(')[0]+"\n")
						for phone in dictwords[('\''+secondpart)]:
							phoneFile.write(phone+"\n")
					elif firstpart in dictwords and secondpart in dictwords:
						wordFile.write(firstpart.split('(')[0]+"\n")
						for phone in dictwords[firstpart]:
							phoneFile.write(phone+"\n")
						wordFile.write(secondpart.split('(')[0]+"\n")
						for phone in dictwords[secondpart]:
							phoneFile.write(phone+"\n")
					elif word.split('(')[0] in dictwords:
						wordFile.write(word.split('(')[0]+"\n")
						for phone in dictwords[word.split('(')[0]]:
							phoneFile.write(phone+"\n")
					else:
						logFile.write("File: "+p+"\n"+"Line: "+i+"Word: "+word+"\n")
				elif word.count('\'') == 2:
					print "yha problem hai ---------------------------------"+word
					# firstpart = word.split('\'')[0]
					# secondpart = word.split('\'')[1]
					# thirdpart = word.split('\'')[2]
					# if (firstpart+'\''+secondpart) in dictwords and ('\''+thirdpart) in dictwords:
					# 	wordFile.write(firstpart+'\''+secondpart)
					# 	for phone in dictwords[firstpart+'\''+secondpart]:
					# 		phoneFile.write(phone+"\n")
					# 	wordFile.write('\\\''+thirdpart)
					# 	for phone in dictwords['\''+thirdpart]:
					# 		phoneFile.write(phone+"\n")
					# elif (firstpart) in dictwords and (secondpart+'\''+thirdpart) in dictwords:
					# 	wordFile.write(firstpart)
					# 	for phone in dictwords[firstpart]:
					# 		phoneFile.write(phone+"\n")
					# 	wordFile.write(secondpart+'\''+thirdpart)
					# 	for phone in dictwords[secondpart+'\''+thirdpart]:
					# 		phoneFile.write(phone+"\n")
					# elif firstpart in dictwords and secondpart 
				elif word.split('(')[0] in dictwords:
					wordFile.write(word.split('(')[0]+"\n")
					for phone in dictwords[word.split('(')[0]]:
						phoneFile.write(phone+"\n")
				else:
					logFile.write("File: "+p+"\n"+"Line: "+i+"Word: "+word+"\n")
					# if word not in dictwords:
					# 	if word.split('(')[0] in dictwords:
					# 		if word[0] == '\'' or word[0] == '\"':
					# 			wordFile.write('\\')
					# 		wordFile.write(word.split('(')[0]+"\n")
					# 		for phone in dictwords[word.split('(')[0]]:
					# 			phoneFile.write(phone+"\n")
					# 	elif word[0] == '\'' or word[0] == '\"':
					# 		subWord = word[1:]
					# 		if subWord in dictwords:
					# 			wordFile.write(subWord+"\n")
					# 			for phone in dictwords[subWord]:
					# 				phoneFile.write(phone+"\n")
					# 		elif subWord.split('(')[0] in dictwords:
					# 			wordFile.write(subWord.split('(')[0]+"\n")
					# 			for phone in dictwords[subWord.split('(')[0]]:
					# 				phoneFile.write(phone+"\n")
					# 		else:
					# 			logFile.write("File: "+p+"\n"+"Line: "+i+"Word: "+word+"\n")
					# 	else:
					# 		logFile.write("File: "+p+"\n"+"Line: "+i+"Word: "+word+"\n")
					# else:
					# 	if word[0] == '\'' or word[0] == '\"':
					# 		wordFile.write('\\')
					# 	wordFile.write(word.split('(')[0]+"\n")
					# 	for phone in dictwords[word]:
					# 		phoneFile.write(phone+"\n")
		
		wordFile.close()
		phoneFile.close()
		currIndex = currIndex+1	

	f.close()	

targetFile.close()

