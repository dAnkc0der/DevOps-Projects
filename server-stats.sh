#!/bin/bash

echo "Total CPU usage."
top -bn5 2>/dev/null| grep -i "CPU(s)" | awk '{sum+=$8} END {avg=sum/NR; cpu=100-avg; print cpu"%"}'
echo "======================="

echo "Total Memory Usage."
free -mh | grep Mem | awk '{used=(($2-$7)/$2)*100;free=$7/$2; print "Used Memory: ", used"%"," ", "Free Memory: ", free"%"}'
echo "====================="

echo "Total Disk usage."
df -h | awk '{print $1,$3,$4,$5}' | column -t
echo "===================="

echo "Top 5 processes by CPU usage."
ps -eo pid,comm,%cpu,%mem --sort=%cpu | head -n 6
echo "====================="

echo "Top 5 processes by Memory usage."
ps -eo pid,comm,%cpu,%mem --sort=%mem | head -n 6
