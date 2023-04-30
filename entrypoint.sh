#!/bin/sh
set -e

bin/rails db:migrate

rm -f tmp/pids/server.pid && bin/rails s
