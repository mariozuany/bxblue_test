#!/usr/bin/env bash

cp ./project_config_assets/local_env.yml ./config/local_env.yml
rake db:setup
rake db:migrate
psql memories_development < ./project_config_assets/countries.pg
psql memories_development < ./project_config_assets/weathers.pg
rails s