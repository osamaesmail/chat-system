#!/bin/bash

set -e
rm -f /chat-app/tmp/pids/server.pid
exec "$@"