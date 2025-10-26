#!/bin/bash 

OUTPUT="/home/aamiot/projects/project-1-system-admin/monitoring_lab"
SNAP="$OUTPUT/mini_report_$(/usr/bin/date +%F_%H%M).txt"

{ /usr/bin/ps aux --sort=-%mem | /usr/bin/head -n 5
echo ""
/usr/bin/top -bn1 | /usr/bin/head -n 15; } >> "$SNAP" 


