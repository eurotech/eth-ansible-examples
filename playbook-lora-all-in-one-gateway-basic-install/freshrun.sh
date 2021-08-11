#!/bin/bash

echo "******FRESHRUN.SH******"
echo ""

echo "~~~~~~Remove Old Files~~~~~~"
rm -rfv ./ansible/* 

echo ""
echo "~~~~~~Extract New Files~~~~~~"
tar -xvf lora-all-in-one-gateway-base-install-0.1.0-playbook.tar.gz --one-top-level=ansible

echo ""
echo "~~~~~~Stop All Docker Containers~~~~~~"
docker kill $(docker ps -q)

echo ""
echo "~~~~~~Delete All Docker Containers~~~~~~"
docker rm $(docker ps -a -q)

echo ""
echo "~~~~~~Delete All Docker Volumes~~~~~~"
docker volume rm $(docker volume ls -q)

echo ""
echo "~~~~~~Delete Chirpbridge Docker Network~~~~~~"
docker network rm chirpbridge

echo ""
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~~~~~~Run New Playbook~~~~~~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
ansible-playbook ./ansible/site.yml