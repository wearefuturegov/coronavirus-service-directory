# Camden coronavirus response service directory

A simple directory of services that can help residents cope if they're staying at home due to the coronavirus pandemic.

It uses the `geocoder` gem to add geographic functionality to services.

## Running it locally

You need ruby, rails and a local postgresql server running.

```
bundle install
# create database and run migrations
rails db:setup
# populate initial database
rails db:seed
rails s
```

It will be on localhost:3000.

## Running it on the web

Suitable for 12-factor compliant hosting like Heroku.

Don't forget to run the database migrations:

```
rails db:migrate
```