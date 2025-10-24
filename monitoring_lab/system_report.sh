#!/usr/bin/env bash

#1. Set a variable for the output file
OUTFILE="basic_report.txt"

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

