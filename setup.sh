#!/bin/bash
bundle install --path vendor/bundle --clean
bundle update
bundle exec rake db:drop RAILS_ENV=production
bundle exec rake db:migrate RAILS_ENV=production
