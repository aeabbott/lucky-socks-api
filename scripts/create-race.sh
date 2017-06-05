#!/bin/bash

TOKEN=BAhJIiVmMTQ3YjMxNGIxNjI4ZWI1MjE4NWNjNjdkZTRhM2QxYgY6BkVG--7e8efd59aeaaee471d9afb8c7dded9336bc7cd8e
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
