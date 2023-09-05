#!/bin/bash

# Directory containing the log files
log_directory="~/BashScripts"

# Output file for the failed passwords
failed_passwords="failed_passwords.txt"

# Clear the failed passwords file if it already exists
> "$failed_passwords"

# Loop through each log file in the input directory
for log_file in "$log_directory"/*.log; do
    # Check if the file is a regular file
    if [[ -f "$log_file" ]]; then
        echo "Processing $log_file..."
        
        # Find lines containing "Failed password" in the log file
        password_lines=$(grep "Failed password" "$log_file")
        
        # Append the error lines to the summary file
        if [[ -n "$password_lines" ]]; then
            echo "Failed passwords in $log_file:" >> "$failed_passwords"
            echo "$password_lines" >> "$failed_passwords"
            echo "" >> "$failed_passwords"
        fi
        
        echo "Finished processing $log_file"
    fi
done

echo "Failed passwords saved in $failed_passwords"
