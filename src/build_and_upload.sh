#!/bin/bash

echo "Building binaries using Docker Compose..."
docker-compose up --build

echo "Generating build report..."
BUILD_LOG="build_report.txt"
echo "Build Report - $(date)" > $BUILD_LOG
echo "x86_64 Binary: $(ls target/x86_64-unknown-linux-gnu/release/)" >> $BUILD_LOG
echo "aarch64 Binary: $(ls target/aarch64-unknown-linux-gnu/release/)" >> $BUILD_LOG

echo "Uploading to GitHub Release..."
gh release create "v1.0.0" target/x86_64-unknown-linux-gnu/release/* target/aarch64-unknown-linux-gnu/release/* \
  --title "Release v1.0.0" --notes "Cross-compiled binaries and build report."

gh release upload "v1.0.0" $BUILD_LOG
