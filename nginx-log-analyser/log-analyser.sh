#!/bin/bash

workDir="$(pwd)"

printf  "TOP 5 IP Addresses\n\n"

awk '{print $1}' "$workDir/nginx.log" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'

echo "============================================================================"

printf "TOP 5 most requested path\n\n"

awk '{print $7}' "$workDir/nginx.log" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'

echo "============================================================================"

printf "TOP 5 response status code\n\n"

awk '{print $9}' "$workDir/nginx.log" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'

echo "============================================================================"

printf "TOP 5 user Agents\n\n"

awk -F\" '{print $6}' nginx.log | sort | uniq -c | sort -rn | head -5 | awk '{print $2, "-", $1, "requests"}'