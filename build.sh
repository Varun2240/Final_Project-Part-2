#!/bin/sh

# Build and bring up services with Docker Compose
docker-compose up --build

# Compile Binary for both architectures
cross build --release --target x86_64-unknown-linux-gnu
cross build --release --target aarch64-unknown-linux-gnu

# Authenticate GitHub
export GITHUB_TOKEN=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

# Upload Binary to the Repository
docker-compose run upload