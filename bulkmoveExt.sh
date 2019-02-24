#!/bin/bash
#Moves all files with extension specfied with $1 to dir specified with $2
echo find . -name '*.'$1'' -exec mv {} $2 \;