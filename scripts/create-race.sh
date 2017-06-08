#!/bin/bash

TOKEN=BAhJIiU2NDMyNjU4NTkzMDAwMDgwZjU1OGUwZmQ1M2EyNTI0ZAY6BkVG--a9912be5924908a52914a0912bcacf13356de33d
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/races"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "race": {
      "name": "Race Name",
      "distance":"13.1",
      "time": "183921",
      "race_day":"2017-02-15",
      "location":"race location"
    }
  }'

echo
