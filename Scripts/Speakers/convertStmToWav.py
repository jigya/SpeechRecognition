import subprocess
import os

if not os.path.exists('./TedLiumFiles'):
	os.makedirs('./TedLiumFiles')

if not os.path.exists('./TedLiumFiles/train'):
	os.makedirs('./TedLiumFiles/train')

if not os.path.exists('./TedLiumFiles/train/WavFiles'):
	os.makedirs('./TedLiumFiles/train/WavFiles')

pathOfSphFiles = '../kaldi-trunk/egs/tedlium/s5/db/TEDLIUM_release2/train/sph'

for i in os.listdir(pathOfSphFiles):
	if i.endswith(".sph"):
		cmdLine = "../kaldi-trunk/tools/sph2pipe_v2.5/sph2pipe -f wav "+pathOfSphFiles+"/"+i+" "+"./TedLiumFiles/train/WavFiles/"+i.split('.')[0]+".wav"
		print cmdLine
		args = cmdLine.split()
		popen = subprocess.call(args, stdout=subprocess.PIPE)
