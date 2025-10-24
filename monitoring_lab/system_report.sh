#!/usr/bin/env bash
set -euo pipefail


#1. Where to save  

SNAP_DIR="/home/aamiot/projects/project-1-system-admin/monitoring_lab/observations"
mkdir -p "$SNAP_DIR"

#2. Timestamped file 
STAMP="$(date +%F%H%M)"
OUTFILE="$SNAP_DIR/snapshot_${STAMP}.txt"

#2. Output several commands by grouping 

{
	echo "--Basic System Report--"
	date 
	echo
	echo "--Uptime--"
	uptime
	echo
	echo "--Who--"
	who
	echo 
	echo "--Memory--"
	free -h
	echo
	echo "--Desk--"
	df -h
	echo
	echo "--Network Ports--"
	ss -tuln
} > "$OUTFILE"

echo "Report saved to $OUTFILE"

