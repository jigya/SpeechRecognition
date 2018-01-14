import codecs

with codecs.open('mapEngToHindi', encoding='utf-8') as f:
	input = f.readlines()

print input[0]
