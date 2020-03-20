# Camden coronavirus response service directory

A simple directory of services that can help residents cope if they're staying at home due to the coronavirus pandemic.

It has:
- A simple search page where the user selects the kind of help they need and gives their postcode
- A results page showing relevant services, nearest first

It uses the `geocoder` gem to power geocoding functionality.

## Configuration

The list of categories that can be searched by are defined in `app/model/service.rb`. Make sure the data source matches these.

The following environment variables can be set:

- `GOOGLE_API_KEY`: an API key from google with the [geocoding API](https://developers.google.com/maps/documentation/geocoding/intro) enabled
- `DATASOURCE`: optional, public URL to a csv data source, [see below](#seeding-the-production-database)
- `GA_PROPERTY_ID`: optional, for Google Analytics tracking

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

Suitable for [12-factor](https://12factor.net/) compliant hosting like Heroku.

Don't forget to run the database migrations:

```
rails db:migrate
```

### Seeding the production database

It's intended to consume data from a Google Sheet.

If you have the `DATASOURCE` environment variable set, running `rails csv` will run a custom rake task to parse the CSV data and seed the database from it.
