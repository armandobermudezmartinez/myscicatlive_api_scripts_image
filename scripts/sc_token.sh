#!/bin/bash

# Request the token and extract it using jq
TOKEN=$(curl -s -X POST --header 'Content-Type: application/json' \
  --header 'Accept: application/json' \
  -d '{"username":"ingestor", "password":"aman"}' \
  'http://scicatlive-backend-1:3000/api/v3/Users/login' | jq -r '.access_token')

# Print the token for debugging purposes (optional)
echo "Token: $TOKEN"
