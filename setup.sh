#!/bin/bash
bundle install --path vendor/bundle --clean
bundle update
bundle exec rake db:drop
bundle exec rake db:migrate
