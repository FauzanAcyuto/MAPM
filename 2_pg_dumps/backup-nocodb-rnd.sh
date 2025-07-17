#!/bin/bash

# Load the .env file
export $(grep -v '^#' .env | xargs)

# backup command
pg_dump -Fc -v -d $DBCONNSTRING -f /home/fauzan/3_MAPM/2_pg_dumps/nocodb-rnd-$(date +%Y-%m-%d_%H-%M-%S).bak
