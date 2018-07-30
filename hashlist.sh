#!/bin/bash
#Checks hash of files in current directory and outputs to csv
for f in * ;
	do shasum "$f" >> masterchecksum.csv
done
#Uses masterchecksum.cvs as source of truth, space as a delimeter exports a list of unique files. 
sort -u -t" " -k1,1 checksum.csv >> uniquechecksum.csv

