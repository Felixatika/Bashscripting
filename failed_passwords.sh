#!/bin/bash

# Initialize a variable to store the total count of failed password attempts
total_failed_attempts=0

# Loop through all auth.log files in the directory
for auth_log_file in auth.log*; do
    # Check if the file is a regular file
    if [[ -f "$auth_log_file" ]]; then
        # Extract and count failed password attempts using grep and awk
        failed_attempts=$(grep 'Failed password' "$auth_log_file" | awk '{print $NF}' | sort | uniq -c)
        
        # Print the failed attempts from this file
        echo "Failed attempts in $auth_log_file files:"
        echo "$failed_attempts"
        
        # Add the count of failed attempts from this file to the total count
        total_failed_attempts=$((total_failed_attempts + $(echo "$failed_attempts" | awk '{sum += $1} END {print sum}')))
    fi
done

# Print the total count of failed password attempts across all files
echo "Total failed attempts: $total_failed_attempts"

#List of cron jobs that were opened from multiple auth.logs in the same directory

echo "A list of Cron jobs from multiple files"
grep "CRON" "$auth_log_file" | awk '{print $1, $2, $3}' | sort | uniq

