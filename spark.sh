#This is meant to be the init portion of a larger series of scripts to batch de-dupe and rename files
#for i in *.jpg; do echo "mv '${i}' '$(./exifcheck.sh "${i}")'"; done