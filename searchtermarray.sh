#!/bin/bash

#Declare search terms in the array below in desired order.
#The script will stop on the first possible match
#"Date/Time Original"
#"File Inode Change Date/Time"

declare -a searchterms=("Date/Time Original" "File Inode Change Date/Time")

for i in "${searchterms[@]}"
do
	exifdata=$(exiftool $1 | grep "$i" | head -1 ) 
	if [ "$exifdata" != "" ]
	then
		break
	fi
done

echo "$exifdata"


