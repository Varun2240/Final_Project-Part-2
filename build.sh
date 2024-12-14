#!/bin/sh

# Build and bring up services with Docker Compose
docker-compose up --build

# Compile Binary for both architectures
cross build --release --target x86_64-unknown-linux-gnu
cross build --release --target aarch64-unknown-linux-gnu

# Authenticate GitHub
# The token will be provided as an environment variable
echo $GITHUB_TOKEN | gh auth login --with-token

# Upload Binary to the Repository
docker-compose run upload