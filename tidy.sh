#!/bin/bash
tidy -m -config htmltidy.conf public/*.html
uglifyjs public/js/app.js -b --width 160 --comments all -o public/js/app.js
