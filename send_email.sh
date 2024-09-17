#!/bin/bash

# Check if a recipient email is provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 RECIPIENT_EMAIL"
    exit 1
fi

# Variables
RECIPIENT="$1"
SMTP_SERVER="smtp.gmail.com"
SMTP_PORT="587"
SMTP_USER="jackxdot@gmail.com"
SMTP_PASSWORD="***************"
#get the app password and also change the user->email

sleep 5

TXT_DIR="$HOME/cron/data"
CURRENT_HOUR=$(date "+%Y-%m-%d_%H")
TXT_FILE="$TXT_DIR/$CURRENT_HOUR.txt"

echo "$TXT_FILE"

MESSAGE="$(cat $TXT_FILE)"

echo "$MESSAGE" | s-nail -v -s "Data collected for hour: $CURRENT_HOUR" \
    -S smtp="$SMTP_SERVER:$SMTP_PORT" \
    -S smtp-auth=login \
    -S smtp-auth-user="$SMTP_USER" \
    -S smtp-auth-password="$SMTP_PASSWORD" \
    -S smtp-use-starttls \
    $RECIPIENT

rm -rf $HOME/cron/data

