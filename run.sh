#!/bin/bash
BUNDLE_PATH=vendor/bundle bundle exec rackup -s thin -E production config.ru -p 3171
