#!/bin/bash
url="http://10.0.17.6/IOC.html"

out_file="IOC.txt"

HTML=$(curl -sL "$url" | awk -F'<td>|</td>' '/<td>/ { print $2; getline }')

echo "$HTML" > "$out_file"
