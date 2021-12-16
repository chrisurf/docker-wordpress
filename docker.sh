#!/bin/bash
echo "Build dockder container..."
docker build . -t wordpress
open http://localhost
echo "Run dockder container..."
docker-compose -f wordpress.yaml up