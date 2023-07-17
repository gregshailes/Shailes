#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
puts 'seeding'
bundle exec rake db:seed
puts 'seeded'
bundle exec rake db:migrate
