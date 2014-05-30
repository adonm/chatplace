#!/bin/bash
pkill -9 -f 3171
BUNDLE_PATH=vendor/bundle bundle exec rackup -s thin -E production config.ru -p 3171
