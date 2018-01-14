import sys
sys.path.append('../buckeye-master')

import containers
import buckeye

speaker = buckeye.Speaker('/Users/jigyayadav/Desktop/BTPProject/speakers/s01.zip', load_wavs=True)
track = speaker[0]

with open('/Users/jigyayadav/Desktop/BTPProject/speakers/s01/s0101a/startEndTime.txt') as f:
	lines = f.readlines()
for idx, x in enumerate(lines):
	startTime = float(x.split()[0])
	endTime = float(x.split()[1])
	print startTime, endTime
	filePath = "/Users/jigyayadav/Desktop/BTPProject/speakers/s01/s0101a/SplitFiles/output"+str(idx)+".wav"
	track.clip_wav(filePath, startTime, endTime)