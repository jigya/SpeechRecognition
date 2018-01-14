import os

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

for p in os.listdir("./TedLiumFiles/train/words"):
	y = open('./TedLiumFiles/train/words/'+p)
	for f in y.readlines():
		if f[:2] == '\\\'':
			print f
		# if f.split('\n')[0] not in dictwords:
		# 	print "Yeh kya hua???"+f