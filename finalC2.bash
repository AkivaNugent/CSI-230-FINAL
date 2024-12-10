#!bin/bash

if [ ! ${#} -eq 2 ]; then
	echo "Usage: bash $0 <log_file> < ioc_file>"
	exit 1
fi

log_file="$1"
ioc_file="$2"
out_file="report.txt"

filtered_logs=$(grep -f "$ioc_file" "$log_file" | cut -d " " -f 1,4,7| sed 's/\[//g')

echo "$filtered_logs" > "$out_file"

