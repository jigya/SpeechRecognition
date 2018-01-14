#Create observation probability matrix

import numpy as np 
from decimal import *

def createObservationProbability(numFrames, phoneToNumber, observationProbFile, phoneList, numOfPhones):
	np.set_printoptions(threshold='nan')
	phoneStateToNumber = {}
	obsIdxToRightIdx = {}
	idx = 0
	# Map the numbers in the phoneList to an index
	with open(phoneList) as phoneFile:
		for line in phoneFile:
			if line == "\n":
				print "endline is read"
			phoneStateToNumber[idx] = line
			idx = idx+1
	for k, val in phoneStateToNumber.iteritems():
		phoneme = val.split("[")[0]
		num = int(val[-3])-2
		phonemeNum = phoneToNumber[phoneme]
		obsIdxToRightIdx[k] = phonemeNum+num
	for k, val in obsIdxToRightIdx.iteritems():
		print k, val
	obsProb = np.zeros((numFrames, numOfPhones))
	rowidx = 0
	colidx = 0
	with open(observationProbFile) as f:
		for line in f:
			if "]" in line:
				for x in line.split():
					# if obsIdxToRightIdx[colidx] == 151:
					# 	print "here"+str(colidx)
					obsProb[rowidx][obsIdxToRightIdx[colidx]] = float(x.split(']')[0])
					colidx = colidx+1
				rowidx = rowidx+1
				colidx = 0
			else:
				for x in line.split():
					if x != "[":
						# if obsIdxToRightIdx[colidx] == 151:
						# 	print "here"+str(colidx)
						obsProb[rowidx][obsIdxToRightIdx[colidx]] = float(x)
						colidx = colidx+1
	obsProb = obsProb.T
	# print obsProb
	return obsProb