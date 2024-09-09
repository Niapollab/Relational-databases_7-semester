#!/bin/sh

# Build image
docker build -t rsubd --force-rm=true --no-cache=true -f bin/Dockerfile .

# Build and run container
docker run --name oracledb -p 1521:1521 -p 5500:5500 -p 8080:8080 --cpus=0.5 -m 2g -td rsubd
