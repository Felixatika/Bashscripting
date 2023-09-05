#!/bin/bash

combined_auth_logs=$1

#Grep for failed passwords for valid usernames
grep "Failed password" "$combined_auth_logs" grep -v "invalid users"  
