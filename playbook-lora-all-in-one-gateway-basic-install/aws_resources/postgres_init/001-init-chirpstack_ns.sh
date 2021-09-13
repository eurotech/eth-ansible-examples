#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
    create role chirpstack_ns with login password 'CNSpwLoRa';
    create database chirpstack_ns with owner chirpstack_ns;
EOSQL
