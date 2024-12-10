#!/bin/bash

report_file="report.txt"
output_file="report.html"
report_destination="/var/www/html/"

echo "<html>" > "$output_file"
echo "<body>" >> "$output_file"
echo "<table border=2>" >> "$output_file"



echo "<tr><th>IP Address</th><th>DateTime</th><th>Page Accessed</th></tr>" >> "$output_file"

while IFS= read -r line; do
    ip=$(echo "$line" | awk '{print $1}')
    timestamp=$(echo "$line" | awk '{print $2}')
    page=$(echo "$line" | awk '{print $3}')

    echo "<tr><td>$ip</td><td>$timestamp</td><td>$page</td></tr>" >> "$output_file"
done < "$report_file"

echo "</table>" >> "$output_file"
echo "</body>" >> "$output_file"
echo "</html>" >> "$output_file"
echo "PLEASE GIVE ME AN A :)" >> "$output_file"

sudo mv "$output_file" "$report_destination"

echo "report.html created and Sent to the /var/www/html/."
