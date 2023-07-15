#!/bin/bash

# Cleanup previous startup kits
rm -rf build/example_project

# Run NVFlare provision to generate startup kits
nvflare provision -p project.yml -w build -c custom

# Generate training datasets for each client
python3 build/prepare_data.py --data_dir build/dataset --num_sites 2 --seed 20220324

# Build base docker image
docker build -t nvflare:base -f build/Dockerfiles/Dockerfile.nvflare .

# Build docker images for server, client and admin
docker build -t nvflare:server -f build/Dockerfiles/Dockerfile.server .
docker build -t nvflare:client1 -f build/Dockerfiles/Dockerfile.client1 .
docker build -t nvflare:client2 -f build/Dockerfiles/Dockerfile.client2 .
docker build -t nvflare:admin -f build/Dockerfiles/Dockerfile.admin .
