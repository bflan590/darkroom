#!/bin/bash
src=$1
dest=$2
find $1/. -type f -name "*.jpg" -exec rsync {} $2 \;



