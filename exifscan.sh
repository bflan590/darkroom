#!/bin/bash
#exifscan.sh
search1="Date/Time Original"
search2="File Inode Change Date/Time"

exifdata=$(exiftool $1 | grep "$search1")
#Loop logic that checks for search terms. First if statement checks for presence of data off of "Date/Time Original"
if [ -z "$exifdata" ]; then
	exifdata=$(exiftool $1 | grep "$search2")
fi
echo $exifdata

#IMG_5381.JPG
