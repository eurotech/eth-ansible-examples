#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname="chirpstack_as" <<-EOSQL
    create extension hstore;
EOSQL
