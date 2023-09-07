#!/bin/bash

# Directory containing the log files
directory="/home/kali/BashScripts"

# Initialize counters
total_failed_attempts=0
total_successful_logins=0

# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "Directory not found: $directory"
  exit 1
fi

# Loop through all combined_auth_logs files in the directory
for file in "$directory"/*.log*; do
  if [ -f "$file" ]; then
    # Count failed login attempts and successful logins
    failed_attempts=$(grep -c "Failed password" "$file")
    successful_logins=$(grep -c "Accepted password" "$file")
printf "=%.0s"  $(seq 1 63)
printf "\n"
    
    # Add counts to totals
    ((total_failed_attempts += failed_attempts))
    ((total_successful_logins += successful_logins))
printf "=%.0s"  $(seq 1 63)
printf "\n"
    
    # Display counts for the current file
    echo "File: $file)"
    echo "Failed login attempts: $failed_attempts"
    echo "Successful logins: $successful_logins"
    echo
  fi
done
printf "=%.0s"  $(seq 1 63)
printf "\n"
echo "Total count for both Failed and attempted logins"
echo "Calculating........"
sleep 1
echo "**................."
sleep 2
echo "*****.............."
sleep 3
echo "*******............"
sleep 3
echo "***********........"
sleep 3
echo "*******************"
sleep 4
# Display the total counts across all files
echo "Total failed login attempts: $total_failed_attempts"
echo "Total successful logins: $total_successful_logins"

echo "Operation completed."
#Print a list of cron jobs that were opened from multiple log files
printf "=%.0s"  $(seq 1 63)
printf "\n"

# ANSI escape code for bold text
bold="\e[1m"
underline="\e[4m"
# ANSI escape code to reset formatting
reset="\e[0m"

# Text to print in bold
text="Extra mile challenge"

# Print the text in bold
echo -e "${bold}${underline}${text}${reset}"

    echo " I have found all the Opened cron jobs and stored them in opened_cron_jobs.txt. Check it out now using the cat command!"

for file in "$directory"/*.log*; do
  if [ -f "$file" ]; then
    echo "Cron job entries in $file:" >> opened_cron_jobs.txt
    grep -E 'CRON' "$file" | grep -v 'closed' >> opened_cron_jobs.txt
    echo
  fi
done
