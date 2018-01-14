import transprob as tp
import decoder as dc
import obsprob as op

phoneToNumber = {}
numberToPhone = {}
phoneToNumStates = {}

hmmdefsPath = "./hmmdefs"
languageModel = "./phoneLang.lm"
phoneList = "./phoneList"
obsProbFile = "./observationalProbabilities.log"

stateNamesFile = open("./statenames", "r")

phoneIdx = 0

for l in stateNamesFile.readlines():
	# print l.split()
	phoneToNumber[l.split()[0]] = phoneIdx
	phoneToNumStates[l.split()[0]] = int(l.split()[-1])-2
	numberToPhone[phoneIdx] = l.split()[0]
	phoneIdx = phoneIdx+int(l.split()[-1])-2

# print len(phoneToNumber)

print "numOfPhones=", phoneIdx+1

transitionProb, initialProb = tp.createTransitionMatrix(hmmdefsPath, languageModel, phoneToNumber, phoneToNumStates, phoneIdx)
observationProb = op.createObservationProbability(32878, phoneToNumber, obsProbFile, phoneList, phoneIdx)

d = dc.Decoder(initialProb, transitionProb, observationProb)
print "Decoded: "
print(d.Decode(32878))


