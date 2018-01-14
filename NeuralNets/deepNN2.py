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
logFile = open("deepNN2Log", "w")
NUM_OF_EPOCHS = 100
ds = SupervisedDataSet(26, 51)
n = FeedForwardNetwork()
inLayer = LinearLayer(26)
hiddenLayer1 = SigmoidLayer(100)
hiddenLayer2 = SigmoidLayer(100)
hiddenLayer3 = SigmoidLayer(100)
outLayer = LinearLayer(51)
n.addInputModule(inLayer)
n.addModule(hiddenLayer1)
#n.addModule(hiddenLayer2)
#n.addModule(hiddenLayer3)
n.addOutputModule(outLayer)
inToHidden1 = FullConnection(inLayer, hiddenLayer1)
#hidden1ToHidden2 = FullConnection(hiddenLayer1, hiddenLayer2)
#hidden2ToHidden3 = FullConnection(hiddenLayer2, hiddenLayer3)
hidden3ToOut = FullConnection(hiddenLayer1, outLayer)
n.addConnection(inToHidden1)
#n.addConnection(hidden1ToHidden2)
#n.addConnection(hidden2ToHidden3)
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
	for line in labFileContents:
		if firstLineSkipped == False:
			firstLineSkipped = True
		else:
			lineParts = line.split(' ')
			labFileDictionary[lineParts[0]] = lineParts[2][:-1].lower()
	# processing wav file
	wavFileName = "audio/" + fileName + ".wav"
	(rate,sig) = wav.read(wavFileName)
	mfcc_feat = mfcc(sig,rate,numcep=26)
	print len(mfcc_feat)
	currentDur = 0
	for duration in sorted(labFileDictionary):
		correctPhone = labFileDictionary[duration]
		correctPhoneNumber = phoneList.index(correctPhone)
		print correctPhone
		print correctPhoneNumber
		duration = (float)(duration)
		duration = (int)(duration*100)
		print duration
		while currentDur < duration:
			arr = []
			for iterator in xrange(len(phoneList)):
				arr.append(0)
			arr[correctPhoneNumber] = 1
			ds.addSample(mfcc_feat[currentDur], arr)
			currentDur += 1
print ds
trainer = BackpropTrainer(n, ds)
print "Epoch Number "
trainer.trainUntilConvergence(maxEpochs = 100)
count = 0
#Creating testing dataset
totalPredictions = 0
fileNames = open("testFileNames2.txt", "r")
fileNamesContents = fileNames.readlines()
# Processing Training Files
for fileName in fileNamesContents:
	fileName = fileName[:-1]
	# processing lab file
	labFileDictionary = {}
	labFileName = "labs/" + fileName + ".lab"
	labFile = open(labFileName, "r")
	labFileContents = labFile.readlines()
	firstLineSkipped = False
	for line in labFileContents:
		if firstLineSkipped == False:
			firstLineSkipped = True
		else:
			lineParts = line.split(' ')
			labFileDictionary[lineParts[0]] = lineParts[2][:-1].lower()
	# processing wav file
	wavFileName = "audio/" + fileName + ".wav"
	(rate,sig) = wav.read(wavFileName)
	mfcc_feat = mfcc(sig,rate,numcep=26)
	print len(mfcc_feat)
	currentDur = 0
	for duration in sorted(labFileDictionary):
		correctPhone = labFileDictionary[duration]
		correctPhoneNumber = phoneList.index(correctPhone)
		#print correctPhone
		#print correctPhoneNumber
		duration = (float)(duration)
		duration = (int)(duration*100)
		while currentDur < duration:
			totalPredictions += 1
			arr = []
			for iterator in xrange(len(phoneList)):
				arr.append(0)
			arr[correctPhoneNumber] = 1
			prediction = n.activate(mfcc_feat[currentDur])
			p = prediction.argmax()
			logFile.write("Correct Phone: " + correctPhone + " Predicted Phone: " + phoneList[p] + "\n")
			if p == correctPhoneNumber:
				print "Correct"
				count += 1	
			currentDur += 1
print count
print totalPredictions
#for i in xrange(0, 10000):
#	prediction = n.activate(test_set[0][i])
#	p = prediction.argmax()
#	if p == test_set[1][i]:
#		count += 1
#print "Done with " + str(count) + " correct o/p"
