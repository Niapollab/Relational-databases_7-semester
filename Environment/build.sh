#!/bin/sh

# Find first image file
function find_image {
    for file in image/*.rpm; do
        if [ -f "$file" ]; then
            echo "$file"
            break 1
        fi
    done
}

# Build image
docker build -t rsubd --force-rm=true --no-cache=true --build-arg ORACLE_PWD="Passw0rd" --build-arg IMAGE_FILE="$(find_image)" -f bin/Dockerfile .

# Build and run container
docker run --name oracledb -p 1521:1521 -p 5500:5500 -p 8080:8080 --cpus=0.5 -m 2g -td rsubd
