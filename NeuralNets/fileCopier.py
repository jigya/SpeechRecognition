import shutil
d = 1000
for i in xrange(d):
	if i < 9:
		shutil.copyfile("./audio/hin_000"+str(i+1)+".wav", "./audio/output"+str(i+1)+".wav")
	elif i < 99:
		shutil.copyfile("./audio/hin_00"+str(i+1)+".wav", "./audio/output"+str(i+1)+".wav")
	elif i < 999:
		shutil.copyfile("./audio/hin_0"+str(i+1)+".wav", "./audio/output"+str(i+1)+".wav")
	else:
		shutil.copyfile("./audio/hin_"+str(i+1)+".wav", "./audio/output"+str(i+1)+".wav")
