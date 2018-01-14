#Extract transition probabilties from "hmmdefs" and "language model" file and form transitionProbability matrix

import numpy as np 
import math

def createTransitionMatrix(hmmdefs, languageModel, phoneToNumber, phoneToNumStates, N):
	np.set_printoptions(threshold='nan')
	transProb = np.zeros((N, N))
	initialProb = np.zeros((N, 1))
	# Generate onegram, bigram, backoff weight
	langModelFile = open(languageModel, "r")
	onegram = {}
	bigram = {}
	backoffWeight = {}
	with open(languageModel) as langModelFile:
		for i in xrange(54):
			langModelFile.next()
		for line in langModelFile:
			if "3-grams" in line:
				break
			elif len(line.split()) == 3:
				p_1 = float(line.split()[0])
				wd_1 = line.split()[1]
				bo_wt = float(line.split()[2])
				if wd_1 in phoneToNumber:
					onegram[wd_1] = p_1
					backoffWeight[wd_1] = bo_wt
					initialProb[phoneToNumber[wd_1]] = p_1
			elif len(line.split()) == 4:
				p_2 = float(line.split()[0])
				wd_1 = line.split()[1]
				wd_2 = line.split()[2]
				if wd_1 in phoneToNumber and wd_2 in phoneToNumber:
					bigram[wd_1+" "+wd_2] = p_2


	currentPhone = ""
	with open(hmmdefs) as hmmfile:
		for line in hmmfile:
			if "~h" in line:
				currentPhone = line.split('\"')[1]
			elif "<TRANSP>" in line:
				phoneIdx = phoneToNumber[currentPhone]
				numStates = phoneToNumStates[currentPhone]
				# print(currentPhone+" "+str(phoneIdx)+" "+str(numStates))
				state1to2 = 0.0
				for i in xrange(numStates+2):
					probLine = hmmfile.next()
					for j in xrange(numStates+2):
						if currentPhone == "sp" and i == 0 and j == 1:
							state1to2 = math.log10(float(probLine.split()[j]))
						if i == numStates and j == numStates+1:
							state4To5 = math.log10(float(probLine.split()[j]))
						# print(str(i) + " " + str(j) + " " + probLine)
						if i != 0 and j != 0 and i != numStates+1 and j != numStates+1:
							# print(str(phoneIdx + i-1) + " " + str(phoneIdx + j-1) + " " + probLine.split()[j])
							floatProb = float(probLine.split()[j])
							if(floatProb != 0):
								transProb[phoneIdx + i-1][phoneIdx + j-1] = math.log10(floatProb)
							else:
								transProb[phoneIdx + i-1][phoneIdx + j-1] = floatProb
				print currentPhone+" "+str(state4To5)+" "+str(phoneIdx)
				state4Idx = phoneIdx + numStates - 1
				for phoneme, num in phoneToNumber.iteritems():
					# if (phoneme == currentPhone):
					# 	continue
					if currentPhone+" "+phoneme in bigram:
						transProb[state4Idx][num] = state4To5 + bigram[currentPhone+" "+phoneme] + state1to2
					else:
						transProb[state4Idx][num] = state4To5 + backoffWeight[currentPhone] + onegram[phoneme] + state1to2
					# print (str(state4Idx)+" "+str(num)+" "+str(transProb[state4Idx][num]))



	# print(transProb)
	print "Initial prob"
	# print(initialProb)
	return transProb, initialProb



