#!/bin/bash
#Uses exiftool to query metadata and rename. Will look for 'file modify date' first and will fail over to 'date time original' if needed. Use $1 as the dir to run command against.
exiftool "-filename<filemodifydate" "-filename<datetimeoriginal" -d IMG_%Y%m%d_%H%M%S%%-c.%%le -r $1