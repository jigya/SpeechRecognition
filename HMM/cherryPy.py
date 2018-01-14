from flask import Flask, request, redirect, url_for, render_template
from werkzeug import secure_filename
import os
import subprocess

app = Flask(__name__)
wavFile = "./audio/output2.wav"
mfccFile = "./testMfcc/output2.mfc"

@app.route("/sendWav")
def sendWavFile():
	return render_template("form.html")

@app.route("/", methods=['POST'])
def index():
	if request.method == 'POST':
        	fileReceived = request.files['file']
		fileName = "testFile"
		fileExtWav = ".wav"
		fileNameWav = fileName + fileExtWav
		fileDirWav = "audio/"
		fileExtMfc = ".mfc"
		fileNameMfc = fileName + fileExtMfc
		fileDirMfc = "testMfcc/"
		fileReceived.save(os.path.join(fileDirWav,fileNameWav))
		wavFile = fileDirWav + fileNameWav
		mfccFile = fileDirMfc + fileNameMfc
	with open("codetester.scp","w") as myFile:
		myFile.write(wavFile + " " + mfccFile)
	with open("tester.scp","w") as myFile:
		myFile.write(mfccFile)
	cmdLine = "HCopy -T 1 -C configTest -S codetester.scp"
	args = cmdLine.split()
	popen = subprocess.call(args, stdout=subprocess.PIPE)
	cmdLine = "HVite -T 1 -C configHtk -H hmm9/macros -H hmm9/hmmdefs -S tester.scp -l '*' -i recout.mlf -w wdnet -p -5.0 -s 2.5 dict monophones1"
	args = cmdLine.split()
	popen = subprocess.call(args, stdout=subprocess.PIPE)
	recoutFile = open("recout.mlf","r")
	recoutFileLines = recoutFile.readlines()
	retString = ""
	for i in xrange(len(recoutFileLines)-4):
		line = recoutFileLines[i+3]
		line = line[:-1]
		lineParts = line.split(' ')
		if lineParts[2] != "sent-end":
			retString += " "
			retString += lineParts[2]
	return retString

if __name__ == "__main__":
	app.run()
