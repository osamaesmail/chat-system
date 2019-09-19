#!/bin/bash

set -e
rm -f /chat-app/tmp/pids/server.pid

bundle exec sidekiq &
rails db:create && rails db:migrate && rails server -b 0.0.0.0 -p 3000

exec "$@"