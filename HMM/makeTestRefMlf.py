d = 199
for x in range(d):
	fileListPath = "./testref.mlf"
	with open(fileListPath, "a") as myfile:
		myfile.write("\"*/output"+str(x+600)+".lab\"\n")
		with open("./words/output"+str(x+600)+".words") as f:
			for line in f:
				myfile.write(line)
		myfile.write(".\n")
