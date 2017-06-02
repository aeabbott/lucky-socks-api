#!/bin/bash
ID=2
TOKEN=BAhJIiVmMTQ3YjMxNGIxNjI4ZWI1MjE4NWNjNjdkZTRhM2QxYgY6BkVG--7e8efd59aeaaee471d9afb8c7dded9336bc7cd8e
curl --include --request PATCH http://localhost:4741/races/$ID \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"\
  --data '{
    "race": {
      "name": "Updated Name",
      "distance":"26.2",
      "time": "3218",
      "run_date":"2017-03-15",
      "location":"updated location"
    }
  }'

  echo
