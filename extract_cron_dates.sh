#!/bin/bash

# Check if the user provided a valid auth.log file
#if [ $# -ne 1 ]; then
   #echo "Usage: $0 <auth.log>"
    #exit 1
#fi

auth_log="$1"

# Extract month, day, and date when cron jobs are running
grep "CRON" "$auth_log" | awk '{print $1, $2, $3}' | sort | uniq
