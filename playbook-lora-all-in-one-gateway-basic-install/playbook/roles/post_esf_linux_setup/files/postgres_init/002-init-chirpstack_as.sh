#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
    create role chirpstack_as with login password 'CASpwLoRa';
    create database chirpstack_as with owner chirpstack_as;
EOSQL
