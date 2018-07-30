#!/bin/bash
#Argument = image file being renamed 
#This script assumes that the File Inode Change Date/Time is an 18 character numberical string when dashes/colons are removed
#Exif data is scraped and separated into individual variables. awk isolates the 5th row of the 2nd column and sed removes the colons and spaces.
search1="Date/Time Original"
search2="File Inode Change Date/Time"

exifdata=$(exiftool $1 | grep "$search1")
#Loop logic that checks for search terms. First if statement checks for presence of data off of "Date/Time Original"
if [ -z "$exifdata" ]; then
	exifdata=$(exiftool $1 | grep "$search2")
	exifdata=$(echo "$exifdata" | head -1 | awk -F " : " '{print $2}' | sed -e 'y/:-/  /' -e 's/ //g')
else	
	exifdata=$(echo "$exifdata" | head -1 | awk -F " : " '{print $2}' | sed -e 'y/:-/  /' -e 's/ //g')
fi
echo "Full string is " $exifdata 


year=$(echo $exifdata | sed 's/^.\{0\}\(.*\).\{14\}$/\1/')
month=$(echo $exifdata | sed 's/^.\{4\}\(.*\).\{12\}$/\1/')
day=$(echo $exifdata | sed 's/^.\{6\}\(.*\).\{10\}$/\1/')
hour=$(echo $exifdata | sed 's/^.\{8\}\(.*\).\{8\}$/\1/')
minute=$(echo $exifdata | sed 's/^.\{10\}\(.*\).\{6\}$/\1/')
second=$(echo $exifdata | sed 's/^.\{12\}\(.*\).\{4\}$/\1/')
#Variables are organized to match Google's image storage format.
newname="IMG_"$year$month$day"_"$hour$minute$second".jpg"
echo "$newname" 
#File name is changed to match the new name.
#mv $1 $newname


