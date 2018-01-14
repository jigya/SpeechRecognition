import shutil
d = 874
for i in xrange(d):
	if (i+400) < 9:
		shutil.copyfile("./audio/hin_000"+str(i+401)+".wav", "./audio/output"+str(i+401)+".wav")
	elif (i+400) < 99:
		shutil.copyfile("./audio/hin_00"+str(i+401)+".wav", "./audio/output"+str(i+401)+".wav")
	elif (i+400) < 999:
		shutil.copyfile("./audio/hin_0"+str(i+401)+".wav", "./audio/output"+str(i+401)+".wav")
	else:
		shutil.copyfile("./audio/hin_"+str(i+401)+".wav", "./audio/output"+str(i+401)+".wav")
