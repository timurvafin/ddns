#!/bin/bash

# Check if environment variables are set
for var in AUTH TOKEN ACCOUNT_ID ZONE_ID RECORD_ID; do
  if [ -z "${!var}" ]; then
    echo "\$$var is not set"
    exit 1
  fi
done

# Get the current IP address
CURRENT_IP=$(curl --ipv4 -s http://icanhazip.com/)
TTL=60

# Check and update the IP address
touch "$WORKDIR/.latest_ip"
LATEST_IP=$(cat "$WORKDIR/.latest_ip")

if [ "$CURRENT_IP" = "$LATEST_IP" ]; then
  echo "IP address unchanged."
else
  echo "Updating IP address..."
  echo "$CURRENT_IP" > "$WORKDIR/.latest_ip"
  curl -u "$AUTH" \
       -H "X-Dnsimple-OTP: $TOKEN" \
       -H "Content-Type: application/json" \
       -H "Accept: application/json" \
       -X "PATCH" \
       -i "https://api.dnsimple.com/v2/$ACCOUNT_ID/zones/$ZONE_ID/records/$RECORD_ID" \
       -d "{\"content\":\"$CURRENT_IP\",\"ttl\":$TTL}"
fi
