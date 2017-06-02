#!/bin/bash

TOKEN=BAhJIiVmMTQ3YjMxNGIxNjI4ZWI1MjE4NWNjNjdkZTRhM2QxYgY6BkVG--7e8efd59aeaaee471d9afb8c7dded9336bc7cd8e
curl --include --request GET http://localhost:4741/races \
--header "Authorization: Token token=$TOKEN"\

  echo
