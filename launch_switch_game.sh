#!/bin/bash

# Load IP address from config.txt
IP_ADDRESS=$(grep -i 'ip=' config.txt | cut -d'=' -f2)

# Ensure the Title ID is passed correctly
if [ -z "$1" ]; then
    echo "No Title ID passed. Please provide a Title ID as an argument."
    exit 1
fi

# Get the argument (Title ID)
TITLE_ID=$1
echo "Received Title ID: $TITLE_ID"

# Check if the Title ID contains letters (A-F) indicating hexadecimal format
if [[ "$TITLE_ID" =~ [A-Fa-f] ]]; then
    echo "Hexadecimal Title ID detected. Converting to Decimal:"

    # Convert the hexadecimal to decimal
    DECIMAL_APP_ID=$(printf "%d\n" "0x$TITLE_ID")

    # Check if the conversion was successful
    if [ -z "$DECIMAL_APP_ID" ]; then
        echo "Error: Conversion failed."
        exit 1
    fi

    echo "Final Decimal App ID: $DECIMAL_APP_ID"

    # Set the appId
    APP_ID=$DECIMAL_APP_ID
else
    # Use Title ID directly if it's already in Decimal form
    echo "Title ID is already in Decimal format."
    APP_ID=$TITLE_ID
fi

# Debugging: Show the final appId that will be used
echo "Final appId being used: $APP_ID"

# If the appId is valid, send the curl request
if [ -n "$APP_ID" ]; then
    curl -X POST "http://$IP_ADDRESS:8080/launch" \
        -H "Accept: */*" \
        -H "Content-Type: application/json" \
        --data-raw "{\"appId\":\"$APP_ID\"}" \
        --insecure
else
    echo "Error: App ID is not valid."
    exit 1
fi
