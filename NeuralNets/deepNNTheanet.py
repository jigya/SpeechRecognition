import climate
import theanets
import numpy as np 

climate.enable_default_logging()

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
from sklearn.metrics import classification_report, confusion_matrix

def split_data(X, y, slices):
    '''
    Splits the data into training, validation and test sets.
    slices - relative sizes of each set (training, validation, test)
        test - provide None, since it is computed automatically
    '''
    datasets = {}
    starts = np.floor(np.cumsum(len(X) * np.hstack([0, slices[:-1]])))
    slices = {
        'training': slice(starts[0], starts[1]),
        'validation': slice(starts[1], starts[2]),
        'test': slice(starts[2], None)}
    data = X, y
    def slice_data(data, sl):
        return tuple(d[sl] for d in data)
    for label in slices:
        datasets[label] = slice_data(data, slices[label])
    return datasets

phoneList = []
logFile = open("deepNNTheanetLog.txt", "w")
result = open("deepNNTheanetResults.txt", "w")
NUM_OF_EPOCHS = 200

X_arr = []
y_arr = []

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
			# arr = []
			# for iterator in xrange(len(phoneList)):
			# 	arr.append(0)
			# arr[correctPhoneNumber] = 1
			X_arr.append(inputList)
			y_arr.append(correctPhoneNumber)
		currentDur += 1

X = np.array(X_arr).astype(np.float32)
y = np.array(y_arr).astype(np.int32)

print "Shape of y: "+str(y.shape)
print "Shape of X: "+str(X.shape)

print(X)
print(y)
# for p in y:
# 	print str(p)+" "

datasets = split_data(X, y, (0.8, 0.1, None))


exp = theanets.Experiment(theanets.Classifier, layers=(286, 600, 600, 51), hidden_l1=0.1)


# for i in xrange(0, NUM_OF_EPOCHS):
# 	logFile.write("Epoch Number: " + str(i) + "\n")
# 	print "Epoch Number " + str(i) + "\n"
# 	exp.train(datasets['training'],datasets['validation'],optimize='sgd',learning_rate=0.01,momentum=0.5)
# 	X_test, y_test = datasets['test']
# 	y_pred = exp.network.classify(X_test)

# 	result.write('classification_report:\n', classification_report(y_test, y_pred))
# 	result.write('confusion_matrix:\n', confusion_matrix(y_test, y_pred))


# exp.train(datasets['training'],datasets['validation'],optimize='sgd',learning_rate=0.01,momentum=0.5)

exp.train(datasets['training'],datasets['validation'],optimize='rprop',learning_rate=0.01)
exp.save('./savedNeuralNetwork')

# exp.load('./savedNeuralNetwork')
X_test, y_test = datasets['test']
y_pred = exp.network.classify(X_test)

total = 0
correct = 0

for p, q in zip(y_test, y_pred):
	result.write("Correct phoneme number: "+str(p)+" Predicted phoneme number: "+str(q)+"\n")
	total = total+1
	if p == q:
		correct = correct+1
result.write('------------------------------------------------------------------------------\n')
result.write('Total phonemes: '+str(total)+"\n")
result.write('Predicted phonemes: '+str(correct)+"\n")

print('Total phonemes: '+str(total)+"\n")
print('Predicted phonemes: '+str(correct)+"\n")

result.write('classification_report:\n')
result.write(classification_report(y_test, y_pred))
result.write('confusion_matrix:\n')
result.write(confusion_matrix(y_test, y_pred))






