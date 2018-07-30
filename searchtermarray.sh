#!/bin/bash

#Declare search terms in the array below in desired order.
#The script will stop on the first possible match
#"Date/Time Original"
#"File Inode Change Date/Time"

declare -a searchterms=("$2" "$3")

for i in "${searchterms[@]}"
do
	exifdata=$(exiftool $1 | grep "$i" | head -1 ) #There are 2 matches for Date/Time so this just grabs the first one
		if [ "$exifdata" != "" ]
		then
			break
		fi
done

echo "$exifdata"


