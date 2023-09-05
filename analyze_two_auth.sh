#!/bin/bash

auth_log="$1"
aut_log="$2"

echo "These are the cron Jobs going on"
printf "=%.0s"  $(seq 1 63)
printf "\n"
sleep 1
grep "cron" "$auth_log" | awk {'print $1, $2, $3'} | sort | uniq
sleep 5
echo "These are the IP addresses of failed passwords"
printf "=%.0s"  $(seq 1 63)
printf ="\n"
grep "Failed password" "$aut_log" | grep -v "message repeated" |  awk {'print $11'} | sort | uniq

