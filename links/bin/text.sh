#!/bin/bash -e

my_number='+18582473666'

if [ "$1" == "susan" ]; then
    number='+18582478946'
elif [ "$1" == "anders" ]; then
    number='+18582478944'
elif [ "$1" == "christian" ]; then
    number='+4530246587'
else
    echo "recipient '$1' not recognized"
    exit 1
fi

if [ -z "$TWILIO_AUTH_TOKEN" ]; then
    echo "error: TWILIO_AUTH_TOKEN not set"
    exit 1
fi

twilio_account_sid=AC4f71fe53fd07f12da0cea8295b078548
twilio_auth_token=$TWILIO_AUTH_TOKEN

message="$2"

# Send a text message
response=$(curl -X POST --fail --show-error --silent\
    "https://api.twilio.com/2010-04-01/Accounts/$twilio_account_sid/Messages.xml"\
    --data-urlencode "From=$my_number" \
    --data-urlencode "To=$number" \
    --data-urlencode "Body=$message" \
    -u "$twilio_account_sid:$twilio_auth_token" )

# Log errors
if [ $? -gt 0 ]; then
    echo "Failed to send SMS: $response"
    exit 1
fi
