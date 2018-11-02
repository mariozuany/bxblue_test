# README

This is a project exam for BxBlue admission process.

## Requirements
- Ruby and Ruby on Rails (duh)
- Postgres
- OpenWeather API Key - Get one at [http://openweathermap.org/]

## Setup
1. Run `bundle install`
1. Copy `./project_config_assets/local_env.yml` to `./config/local_enf.yml` and edit it with your credentials.
2. Run `rake db:migrate` to setup the DB.
3. Run `pg_restore --data-only -d memories_development -t countries /project_config_assets/countries.pg`
4. Run `pg_restore --data-only -d memories_development -t weathers /project_config_assets/weathers.pg`
5. `rails s` to start up the webserver.

