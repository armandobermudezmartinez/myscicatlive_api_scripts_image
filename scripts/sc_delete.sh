#!/bin/bash

# curl -v -X 'DELETE' \
#   'http://backend.localhost/api/v3/datasets/undefined%2F36dffdb8-8bce-41d9-851b-41dce66e943b' \
#   -H 'accept: */*' -H "Authorization: Bearer $TOKEN"

# echo "Logging in ..."
source /app/scripts/sc_token.sh

# Check if a dataset ID was provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <dataset_id>"
  return
fi

# Assign the first argument to the DATASET_ID variable
DATASET_ID=$1

# Substitute '/' with '%2F' in the dataset ID
ENCODED_DATASET_ID=$(echo "$DATASET_ID" | sed 's/\//%2F/g')

url="http://backend.localhost/api/v3/datasets/$ENCODED_DATASET_ID"

response=$(curl -s -o /dev/null -w "%{http_code}" -X 'DELETE' "$url" \
  -H 'accept: */*' -H "Authorization: Bearer $TOKEN")

# Clean up the response
response_code=$(echo "$response" | tr -d '\r')
# response_code = ${response//$'\r'/}

# Check the response status code
if [ "$response_code" -eq 204 ] || [ "$response_code" -eq 200 ]; then
  echo "Dataset '$DATASET_ID' deleted successfully."
else
  echo "Failed to delete dataset '$DATASET_ID'. HTTP Status Code: $response"
fi
