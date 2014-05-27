#!/bin/bash
pkill -f 3171
sleep 2
BUNDLE_PATH=vendor/bundle nohup bundle exec rackup -s thin -E production config.ru -p 3171 &
tail -f log/production.log
