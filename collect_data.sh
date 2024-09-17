#!/bin/bash

# Variables
TXT_DIR="$HOME/cron/data"
CURRENT_HOUR=$(date "+%Y-%m-%d_%H")
TXT_FILE="$TXT_DIR/$CURRENT_HOUR.txt"

# Ensure the directory exists
mkdir -p $TXT_DIR

# Get public IP address
IP_ADDRESS=$(curl -s ifconfig.me)

# Get the current time
CURRENT_TIME=$(date "+%Y-%m-%d %H:%M:%S")

# Get the username
USERNAME=$(whoami)

# Get location information based on IP (using ipinfo.io)
LOCATION=$(curl -s https://ipinfo.io/$IP_ADDRESS | grep -E 'city|region|country' | tr -d '"',)

# Get battery percentage (for Linux systems)
BATTERY_PERCENTAGE=$(acpi -b | grep -P -o '[0-9]+(?=%)')

MESSAGE="
Your current IP address is: $IP_ADDRESS
Time: $CURRENT_TIME
Username: $USERNAME
Location: $LOCATION
Battery Percentage: $BATTERY_PERCENTAGE%
&&&&&&---=---%%%%%%
"

# Append data to CSV
echo "$MESSAGE" >> $TXT_FILE
