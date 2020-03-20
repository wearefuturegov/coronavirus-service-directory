# Camden coronavirus response service directory

A simple directory of services that can help residents cope if they're staying at home due to the coronavirus pandemic. Originally commissioned by Camden Borough Council.

It has:
- 🕵️‍♀️ A simple **search page** where the user selects the kind of help they need and gives their postcode
- 📍 A **results page** showing relevant services, nearest first

It uses the [`geocoder`](https://github.com/alexreisner/geocoder) gem and [Google's geocoding API]((https://developers.google.com/maps/documentation/geocoding/intro)) to power geographical functionality.

## Configuration

The list of categories that can be searched by are defined in `app/model/service.rb`. Make sure the data source matches these.

The following environment variables can be set:

- `GOOGLE_API_KEY`: an API key from google with the geocoding API enabled
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

You can consume data straight from a Google Sheet, if it's formatted in the right way.

1. Get your data into the right format. Here's an [example sheet](https://docs.google.com/spreadsheets/d/1hLhz_FqSyyO_KP5OiQbEZYiVzo_6dgOIWIb1S57xhMg/) to get you started.
2. Make sure your sheet is publicly sharable
3. Add `/export?format=csv` to the end of the URL to get a link to a CSV version, and save that as an environment variable called `DATASOURCE`.
4. Run `rails csv` using the Heroku console or your hosting's equivalent

It should pull in all the rows from your data sheet and geocode postcodes into latitudes and longitudes.

If your data schema is different, you might need to adjust the `rails csv` task a little. You can see what the task does in `lib/tasks/csv.rake`.
