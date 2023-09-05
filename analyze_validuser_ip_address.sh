#!/bin/bash

combined_auth_logs=$1

grep "Failed password" "$combined_auth_logs" | grep -v "invalid users" | cut -f 11 -d ' ' |  sort | uniq
