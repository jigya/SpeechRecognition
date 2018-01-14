from pybrain.datasets import SupervisedDataSet
from pybrain.tools.shortcuts import buildNetwork
from pybrain.supervised.trainers import BackpropTrainer
from pybrain.structure import FeedForwardNetwork
from pybrain.structure import LinearLayer, SigmoidLayer
from pybrain.structure import FullConnection
from features import mfcc
from features import logfbank
import scipy.io.wavfile as wav
import gzip
import cPickle
import os
import sys
import scipy.io
import math
import numpy
phoneList = []
logFile = open("deepNN3Log.txt", "w")
result = open("deepNN4results.txt", "w")
NUM_OF_EPOCHS = 2000
ds = SupervisedDataSet(286, 51)
n = FeedForwardNetwork()
inLayer = LinearLayer(286)
hiddenLayer1 = SigmoidLayer(1000)
hiddenLayer2 = SigmoidLayer(1000)
# hiddenLayer3 = SigmoidLayer(100)
outLayer = LinearLayer(51)
n.addInputModule(inLayer)
n.addModule(hiddenLayer1)
n.addModule(hiddenLayer2)
# n.addModule(hiddenLayer3)
n.addOutputModule(outLayer)
inToHidden1 = FullConnection(inLayer, hiddenLayer1)
hidden1ToHidden2 = FullConnection(hiddenLayer1, hiddenLayer2)
# hidden2ToHidden3 = FullConnection(hiddenLayer2, hiddenLayer3)
hidden3ToOut = FullConnection(hiddenLayer2, outLayer)
n.addConnection(inToHidden1)
n.addConnection(hidden1ToHidden2)
# n.addConnection(hidden2ToHidden3)
n.addConnection(hidden3ToOut)
n.sortModules()
#print n
# Creating list of phonemes
phoneListFile = open("phoneList", "r")
phoneListContents = phoneListFile.readlines()
for phone in phoneListContents:
	phone = phone[:-1]
	phoneList.append(phone)
print phoneList
print len(phoneList)
#Creating training dataset
fileNames = open("fileNames2.txt", "r")
fileNamesContents = fileNames.readlines()
# Processing Training Files
for fileName in fileNamesContents:
	fileName = fileName[:-1]
	print fileName
	# processing lab file
	labFileDictionary = {}
	labFileName = "labs/" + fileName + ".lab"
	labFile = open(labFileName, "r")
	labFileContents = labFile.readlines()
	firstLineSkipped = False
	prevFrame = 0
	for line in labFileContents:
		if firstLineSkipped == False:
			firstLineSkipped = True
		else:
			lineParts = line.split(' ')
			while prevFrame < (int)(((float)(lineParts[0]))*100):
				labFileDictionary[prevFrame] = lineParts[2][:-1].lower()
				prevFrame += 1
	#print labFileDictionary
	# processing wav file
	wavFileName = "audio/" + fileName + ".wav"
	(rate,sig) = wav.read(wavFileName)
	mfcc_feat = mfcc(sig,rate,numcep=26)
	#print len(mfcc_feat)
	currentDur = 0
	for frame in sorted(labFileDictionary):
		#print "--------FRAME NUMBER " + str(frame) + "----------------" + str(currentDur)
		if currentDur >= 5 and currentDur < (len(mfcc_feat)-5):
			inputList = []
			for iterator in xrange(11):
				#print currentDur + iterator - 5
				inputList.extend(mfcc_feat[currentDur + iterator - 5])
			correctPhone = labFileDictionary[currentDur]
			correctPhoneNumber = phoneList.index(correctPhone)
			#print correctPhone
			#print correctPhoneNumber
			arr = []
			for iterator in xrange(len(phoneList)):
				arr.append(0)
			arr[correctPhoneNumber] = 1
			ds.addSample(inputList, arr)
		currentDur += 1
print ds
trainer = BackpropTrainer(n, ds)
for i in xrange(0, NUM_OF_EPOCHS):
	logFile.write("Epoch Number: " + str(i) + "\n")
	print "Epoch Number " + str(i) + "\n"
	trainer.train()
	count = 0
	#Creating testing dataset
	totalPredictions = 0
	fileNames = open("testFileNames2.txt", "r")
	fileNamesContents = fileNames.readlines()
	for fileName in fileNamesContents:
		fileName = fileName[:-1]
		# print fileName
		# processing lab file
		labFileDictionary = {}
		labFileName = "labs/" + fileName + ".lab"
		labFile = open(labFileName, "r")
		labFileContents = labFile.readlines()
		firstLineSkipped = False
		prevFrame = 0
		for line in labFileContents:
			if firstLineSkipped == False:
				firstLineSkipped = True
			else:
				lineParts = line.split(' ')
				while prevFrame < (int)(((float)(lineParts[0]))*100):
					labFileDictionary[prevFrame] = lineParts[2][:-1].lower()
					prevFrame += 1
		# print labFileDictionary
		# processing wav file
		wavFileName = "audio/" + fileName + ".wav"
		(rate,sig) = wav.read(wavFileName)
		mfcc_feat = mfcc(sig,rate,numcep=26)
		# print len(mfcc_feat)
		currentDur = 0
		for frame in sorted(labFileDictionary):
			# print "--------FRAME NUMBER " + str(frame) + "----------------" + str(currentDur)
			if currentDur >= 5 and currentDur < (len(mfcc_feat)-5):
				totalPredictions += 1
				inputList = []
				for iterator in xrange(11):
					# print currentDur + iterator - 5
					inputList.extend(mfcc_feat[currentDur + iterator - 5])
				correctPhone = labFileDictionary[currentDur]
				correctPhoneNumber = phoneList.index(correctPhone)
				# print correctPhone
				# print  correctPhoneNumber
				prediction = n.activate(inputList)
				p = prediction.argmax()
				logFile.write("Correct Phone: " + correctPhone + " Predicted Phone: " + phoneList[p] + "\n")
				if p == correctPhoneNumber:
					# print "Correct"
					count += 1
			currentDur += 1
	print count
	print totalPredictions
	result_text = str(i)+" "+str(count) +" "+str(totalPredictions)+"\n"
	result.write(result_text)
# Processing Training Files
#for fileName in fileNamesContents:
#	fileName = fileName[:-1]
	# processing lab file
#	labFileDictionary = {}
#	labFileName = "labs/" + fileName + ".lab"
#	labFile = open(labFileName, "r")
#	labFileContents = labFile.readlines()
#	firstLineSkipped = False
#	for line in labFileContents:
#		if firstLineSkipped == False:
#			firstLineSkipped = True
#		else:
#			lineParts = line.split(' ')
#			labFileDictionary[lineParts[0]] = lineParts[2][:-1].lower()
	# processing wav file
#	wavFileName = "audio/" + fileName + ".wav"
#	(rate,sig) = wav.read(wavFileName)
#	mfcc_feat = mfcc(sig,rate,numcep=26)
#	print len(mfcc_feat)
#	currentDur = 0
#	for duration in sorted(labFileDictionary):
#		correctPhone = labFileDictionary[duration]
#		correctPhoneNumber = phoneList.index(correctPhone)
		#print correctPhone
		#print correctPhoneNumber
#		duration = (float)(duration)
#		duration = (int)(duration*100)
#		while currentDur < duration:
#			totalPredictions += 1
#			arr = []
#			for iterator in xrange(len(phoneList)):
#				arr.append(0)
#			arr[correctPhoneNumber] = 1
#			prediction = n.activate(mfcc_feat[currentDur])
#			p = prediction.argmax()
#			if p == correctPhoneNumber:
#				print "Correct"
#				count += 1	
#			currentDur += 1
