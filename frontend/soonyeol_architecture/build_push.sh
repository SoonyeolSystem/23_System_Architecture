#!/bin/bash

# Run Flutter build for the web
flutter build web --no-tree-shake-icons

# Build the Docker image & push to Docker Hub
docker buildx build --platform=linux/amd64 --push --tag jaezic/soonyeol-front .