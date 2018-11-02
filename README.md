# README

This is a project exam for BxBlue admission process.

## Requirements
- Ruby and Ruby on Rails (duh)
- Postgres
- OpenWeather API Key - Get one at <http://openweathermap.org/>

## Setup
1. Clone this repository.
2. Copy `./project_config_assets/local_env.yml` to `./config/local_env.yml` and edit it with your credentials.
3. Run `rake db:setup` to create the DB.
4. Run `rake db:migrate` to setup the DB.
5. Run `psql memories_development < ./project_config_assets/countries.pg`
6. Run `psql memories_development < ./project_config_assets/weathers.pg`
7. `rails s` to start up the webserver.

Or you can just `bash ./project_config_assets/setup.sh` and, then, edit the credentials at `./config/local_env.yml`

## Demo
You play with the demo at <https://radiant-oasis-28783.herokuapp.com>