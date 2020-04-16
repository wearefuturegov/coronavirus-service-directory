# Coronavirus response service directory

![Rails Unit Tests](https://github.com/wearefuturegov/coronavirus-service-directory/workflows/Rails%20Unit%20Tests/badge.svg)

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](
https://heroku.com/deploy)

**There's some good stuff happening on the V2 branch of this repo. Take a look!**

A simple, production-ready directory of services that can help residents cope if they're staying at home due to the coronavirus pandemic. 

Originally commissioned by Camden Borough Council. There are alternate skins for different councils on branches. [Read about the project here](https://coronaviruslocalresponse.co.uk/).

It has:
- 📍 A simple **search form and results page** where the user chooses the kind of help they need and gives their postcode, then sees relevant services
- 👩‍💻 A **read-only JSON API** for other applications to consume. Available at `/api/services`
- 🔐 An **admin panel** and user accounts. Anyone can register but to sign in an existing user must first approve the account. At `/admin`.
- 🕵️‍♀️ A form for users to **submit their own services**, which can then be published by an admin. At `/services/new`.

It uses the [`geocoder`](https://github.com/alexreisner/geocoder) gem and [Google's geocoding API](https://developers.google.com/maps/documentation/geocoding/intro) to power geographical functionality.

## Configuration

The list of categories that can be searched by are defined in `app/model/service.rb`. Make sure the data source matches these.

The following environment variables can be set:

- `GOOGLE_API_KEY`: an API key from Google with the geocoding API enabled, used on the server.
- `GOOGLE_CLIENT_KEY`: a API key from Google with the maps and [static maps](https://developers.google.com/maps/documentation/maps-static/intro) APIs enabled, used in the browser. This one will be publicly exposed to lock it down to just the hosts you plan to run the app on.
- `GA_PROPERTY_ID`: optional, for Google Analytics tracking
- `DATASOURCE`: optional, public URL to a CSV data source, [see below](#seeding-the-production-database)
- `SENDGRID_API_KEY` in order to send emails. You could configure the app to use another service like [Notify](https://www.notifications.service.gov.uk/) instead if you wish.

## Running it locally

You need ruby, rails, node.js, npm and a local postgresql server ready.

```
bundle install
npm install

# create database and run migrations
rails db:setup

# populate initial database
rails db:seed

rails s
```

There's a seed file that will fill the database with fake data.

It will be on `localhost:3000` and you can find the admin panel at `/admin`.

If you're using Docker, `docker-compose up` will set up a local database for you.

## Running it on the web

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](
https://heroku.com/deploy)

Suitable for [12-factor](https://12factor.net/) compliant hosting like Heroku.

It has a Procfile to automatically run pending database migrations on every deploy.

### Seeding the production database

Alongside the admin panel, this app can also consume bulk data straight from a Google Sheet, if it's formatted in the right way.

We think this is a good way to get new products up and running fast, because there are no new admin tools to train people on.

1. Get your data into the right format. Here's an [example sheet](https://docs.google.com/spreadsheets/d/1hLhz_FqSyyO_KP5OiQbEZYiVzo_6dgOIWIb1S57xhMg/) to get you started.
2. Make sure your sheet is publicly sharable
3. Add `/export?format=csv` to the end of the URL to get a link to a CSV version, and save that as an [environment variable](https://devcenter.heroku.com/articles/config-vars) called `DATASOURCE`.
4. Run `rails csv` on the hosted app, using the Heroku console or your hosting's equivalent

It should pull in all the rows from your data sheet and geocode postcodes into latitudes and longitudes.

If your data schema is different, you might need to adjust the `rails csv` task a little. You can see what the task does in `lib/tasks/csv.rake`.

## Roadmap

✅ an optional **map view**

✅ a **recommended service** feature, which bumps one service per category to the top of the list

✅ **admin user accounts** and a proper admin panel

✅ a form for the public to **submit their own service** suggestions

✅ Email notifications to users when a new service is submitted for review
