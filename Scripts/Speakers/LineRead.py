with open('/Users/jigyayadav/Desktop/BTPProject/speakers/s01/s0101a/s0101a.words') as f:
	lines = f.readlines()

targetFile = open('/Users/jigyayadav/Desktop/BTPProject/speakers/s01/s0101a/startEndTime.txt', 'w')
start = 1

idx = 9

while idx < len(lines):
	while (idx < len(lines)) and ("<" in lines[idx] or "{" in lines[idx]):
		idx = idx+1
	if idx < len(lines):
		startLine = lines[idx-1]
		while (idx < len(lines)) and ("<" not in lines[idx] and "{" not in lines[idx]):
			idx = idx+1
		endLine = lines[idx-1]
		startTime = startLine.split()[0]
		endTime = endLine.split()[0]
		targetFile.write(startTime+" "+endTime)
		targetFile.write("\n")

targetFile.close()

