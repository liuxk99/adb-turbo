#!/bin/bash

#
# Check the logcat.log* exist and append into array.
# logcat -n 20 -r 5000 will generate logcat.log* like-this
# thomas@Desk07B:~/bin/adb-turbo/Log.0$ ls
# anr  logcat.log  logcat.log.01  logcat.log.02  logcat.log.03  logcat.log.04  tombstones
#
LOG_FILES=()
for i in {20..1}; do
	log_file="logcat.log.$i"
  	if [[ -e ${log_file} ]]; then
    	LOG_FILES+=("${log_file}")
	fi
	log_file="logcat.log.0$i"
  	if [[ -e ${log_file} ]]; then
    	LOG_FILES+=("${log_file}")
	fi
done

log_file=logcat.log
if [[ -e ${log_file} ]]; then
	LOG_FILES+=("${log_file}")
fi

# All elements, space-separated
if [[ ${#LOG_FILES[@]} -gt 0 ]]; then
	echo ${LOG_FILES[@]}
else
	echo "There are no logcat.log* files"
fi