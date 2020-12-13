#!/bin/bash

mkdir /srv/ffxi-topaz | true

cd /srv/ffxi-topaz

docker-compose up --build -d

