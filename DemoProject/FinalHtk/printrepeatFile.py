d = 874
for x in range(d+1):
	fileListPath = "./fileNames.txt"
	with open(fileListPath, "a") as myfile:
		myfile.write("output"+str(x)+"\n")
