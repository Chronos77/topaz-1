#!/bin/bash
aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 035720740802.dkr.ecr.eu-west-1.amazonaws.com

docker build -t ffxi-server .

docker tag ffxi-server:latest 035720740802.dkr.ecr.eu-west-1.amazonaws.com/ffxi-server:latest

docker push 035720740802.dkr.ecr.eu-west-1.amazonaws.com/ffxi-server:latest