#!/bin/bash
# Get the current date
current_date=$(date +"%Y-%m-%d")
current_time=$(date +"%H:%M:%S")
year=$(date +"%Y")
week_number=$(date +"%W")
# Define file paths
template_file="/Users/mteibel/Documents/notes/Templates/Daily.md"
new_file="/Users/mteibel/Documents/notes/Daily/$year/W$week_number/$current_date.md"
# Check if the file already exists
if [ -f "$new_file" ]; then
	echo "Error: File already exists. Not writing to the file."
	exit 1
fi
# Create the folder structure if it doesn't exist
mkdir -p /Users/mteibel/Documents/notes/Daily/$year/W$week_number
# Read the template file and replace placeholders with actual values
sed -e "s/{{title}}/$current_date/g" \
  -e "s/{{date}}/$current_date/g" \
  -e "s/{{time}}/$current_time/g" $template_file >$new_file
echo "Daily note created: $new_file"
