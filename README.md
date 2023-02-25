# Rails API Template

A super simple Rails API-only template with JWT tokens

## Getting Started

```
git clone git@github.com:Esaron/rails-api-template.git
rails db:setup
```

## Running

```
rails s
```

## Getting a token for the demo admin user

```
curl --request POST \
  --url http://localhost:3000/login \
  --header 'Content-Type: application/json' \
  --data '{
	"user_name": "admin",
	"password": "admin"
}'
```

```
{"token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2Nzc0Mzc5Mzl9.G8cD4sBYLcsGbFhdHwHdD9YamWJPpRF0LCxR_YkuOwI","exp":"2023-02-26T18:58:59.281Z","user_name":"admin"}
```

## Using the token

```
curl --request GET \
  --url http://localhost:3000/users \
  --header 'Authorization: Bearer YOUR_TOKEN'
```

```
[{"id":1,"name":null,"user_name":"admin","email":"admin@example.com","password_digest":"$2a$12$13dpVW8VQy2VW4eHyqevE.subCszng8hNCk.iICUeM96SgvqzyPdS","created_at":"2023-02-25T18:29:33.764Z","updated_at":"2023-02-25T18:29:33.764Z"}]
```