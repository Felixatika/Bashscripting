#!/bin/bash

auth_log=$1

grep "CRON" "$auth_log" | awk '{print $1, $2, $3}' | sort | uniq
