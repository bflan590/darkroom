#!/bin/bash
#Argument = image file being renamed 
#This script assumes that the File Inode Change Date/Time is an 18 character numberical string when dashes/colons are removed
#Exif data is scraped and separated into individual variables. awk isolates the 5th row of the 2nd column and sed removes the colons and spaces.

exifdata=$1

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


