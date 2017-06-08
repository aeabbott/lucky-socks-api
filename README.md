[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# rails-api-template
Link to app: https://aeabbott.github.io/lucky-socks-client/
Link to client repo:https://github.com/aeabbott/lucky-socks-client
Link to deployed backend: https://polar-dusk-38066.herokuapp.com/

## ERD
link to ERD:
http://imgur.com/a/Du2le
1. dotted line represents R1
## Dependencies

Install with `bundle install`.

-   [`rails-api`](https://github.com/rails-api/rails-api)
-   [`rails`](https://github.com/rails/rails)
-   [`active_model_serializers`](https://github.com/rails-api/active_model_serializers)
-   [`ruby`](https://www.ruby-lang.org/en/)
-   [`postgres`](http://www.postgresql.org)

Until Rails 5 is released, this template should follow the most recent released
version of Rails 4, as well as track `master` branches for `rails-api` and
`active_model_serializers`.

## Installation

1.  [Download](../../archive/master.zip) this template.
1.  Unzip and rename the template directory.
1.  Empty [`README.md`](README.md) and fill with your own content.
1.  Move into the new project and `git init`.
1.  Install dependencies with `bundle install`.
1.  Rename your app module in `config/application.rb` (change
    `RailsApiTemplate`).
1.  Rename your project database in `config/database.yml` (change
    `'rails-api-template'`).
1.  Create a `.env` for sensitive settings (`touch .env`).
1.  Generate new `development` and `test` secrets (`bundle exec rake secret`).
1.  Store them in `.env` with keys `SECRET_KEY_BASE_<DEVELOPMENT|TEST>`
    respectively.
1.  In order to make requests to your deployed API, you will need to set
    `SECRET_KEY_BASE` in the environment of the production API (using `heroku
    config:set` or the Heroku dashboard).
1.  In order to make requests from your deployed client application, you will
    need to set `CLIENT_ORIGIN` in the environment of the production API (e.g.
    `heroku config:set CLIENT_ORIGIN https://<github-username>.github.io`).
1.  Setup your database with `bin/rake db:nuke_pave` or `bundle exec rake
    db:nuke_pave`.
1.  Run the API server with `bin/rails server` or `bundle exec rails server`.



## API

The Race section outlines the CRUD actions you can perform against /races.

The Authenticate section outlines the CRUD actions you can perform against /users.

All race API actions require a TOKEN. You must authenticate your user first via
the authentication portion of the API before you can CRUD against /races.

### Races

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/races`               | `races#create`    |
| GET    | `/races`               | `races#index`     |
| GET    | `/races/:id`           | `races#show`      |
| PATCH  | `/races/:id`           | `races#update`    |
| DELETE | `/races/:id`           | `racess#destroy`  |


### POST /races

Request:
```sh
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
```

Response:
```sh
HTTP/1.1 201 Created
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Location: http://localhost:4741/races/81
Content-Type: application/json; charset=utf-8
ETag: W/"aeebc76d25a0f48fed4c06c5dd61850b"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e32e455e-1ea3-4467-a1f0-2851ffcce5d3
X-Runtime: 0.020679
Vary: Origin
Transfer-Encoding: chunked

{"race":{"id":81,"name":"Race Name","distance":13.1,"time":183921,"race_day":"2017-02-15","location":"race location","race_pace":"233:59 min/mi"}}
```

### GET /races

Request:

```sh
TOKEN=BAhJIiU4ZjI2MzlhMjZkNmI1NTU0OGNhYzBhMTNmZTcyNjUzZAY6BkVG--f4aed2b5cd6b780adc44919fa509ab0d91e78825
curl --include --request GET http://localhost:4741/races \
--header "Authorization: Token token=$TOKEN"\
```
Response

```sh
HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/"3bf221f73aabbe0ab78f0c8b8e1b77a3"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d29d080f-ca48-411d-b00e-3c8e78e74417
X-Runtime: 0.007881
Vary: Origin
Transfer-Encoding: chunked

{"races":[{"id":80,"name":null,"distance":3.1,"time":1500,"race_day":"2019-05-15","location":"kfdajfkajfk","race_pace":"8:3 min/mi"},{"id":36,"name":"Filler Name","distance":26.2,"time":12946,"race_day":"2017-05-21","location":"Martha's Vineayard","race_pace":"8:14 min/mi"},{"id":79,"name":null,"distance":3.1,"time":1500,"race_day":"2017-05-15","location":"dajkfajkf","race_pace":"8:3 min/mi"},{"id":75,"name":null,"distance":3.1,"time":1380,"race_day":"2017-04-15","location":"Newton","race_pace":"7:25 min/mi"},{"id":81,"name":"Race Name","distance":13.1,"time":183921,"race_day":"2017-02-15","location":"race location","race_pace":"233:59 min/mi"},{"id":60,"name":null,"distance":3.1,"time":1500,"race_day":"2015-09-15","location":"Newton","race_pace":"8:3 min/mi"}]}
```

### GET races/:id

Request:

```sh
TOKEN=BAhJIiU4ZjI2MzlhMjZkNmI1NTU0OGNhYzBhMTNmZTcyNjUzZAY6BkVG--f4aed2b5cd6b780adc44919fa509ab0d91e78825
curl --include --request GET http://localhost:4741/races/27 \
  --header "Authorization: Token token=$TOKEN"
```

Response:
```sh
HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/"6d69efd717ed9d0464978bedd6640130"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 77f16159-5ce0-43e3-85e1-b97caced3c71
X-Runtime: 0.006136
Vary: Origin
Transfer-Encoding: chunked

{"race":{"id":27,"name":"Filler Name","distance":3.1,"time":1380,"race_day":"2017-02-15","location":"Newton","race_pace":"7:25 min/mi"}}
```

### PATCH race/:id

Request:

```sh
ID=27
TOKEN=BAhJIiU4ZjI2MzlhMjZkNmI1NTU0OGNhYzBhMTNmZTcyNjUzZAY6BkVG--f4aed2b5cd6b780adc44919fa509ab0d91e78825
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
  ```

  ```sh
  HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/"4511f44ec21624721c67fe8ee130ceb5"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b0169bc5-8184-452d-8193-a34ed5a781e9
X-Runtime: 0.015862
Vary: Origin
Transfer-Encoding: chunked

{"race":{"id":27,"name":"Updated Name","distance":26.2,"time":3218,"race_day":"2017-02-15","location":"updated location","race_pace":"2:2 min/mi"}}
```

### DELETE race/:id

Request:

``` sh
TOKEN=BAhJIiU4ZjI2MzlhMjZkNmI1NTU0OGNhYzBhMTNmZTcyNjUzZAY6BkVG--f4aed2b5cd6b780adc44919fa509ab0d91e78825
curl --include --request GET http://localhost:4741/races/27 \
  --header "Authorization: Token token=$TOKEN"
```

Response:

``` sh
HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/"4511f44ec21624721c67fe8ee130ceb5"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 14336c8a-fe64-45a3-89b2-9c86f2fc5c83
X-Runtime: 0.003856
Vary: Origin
Transfer-Encoding: chunked

{"race":{"id":27,"name":"Updated Name","distance":26.2,"time":3218,"race_day":"2017-02-15","location":"updated location","race_pace":"2:2 min/mi"}}

```


### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password/$ID" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
ID=1 OLDPW=hannah NEWPW=elle TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl http://localhost:4741/sign-out/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "bob@ava.com"
    },
    {
      "id": 1,
      "email": "ava@bob.com"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "bob@ava.com"
  }
}
```

### Reset Database without dropping

This is not a task developers should run often, but it is sometimes necessary.

**locally**

```sh
bin/rake db:migrate VERSION=0
bin/rake db:migrate db:seed db:examples
```

**heroku**

```sh
heroku run rake db:migrate VERSION=0
heroku run rake db:migrate db:seed db:examples
```

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
# lucky-socks-api
