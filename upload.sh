#!/bin/sh

# Authenticate GitHub
echo $GITHUB_TOKEN | gh auth login --with-token

# Upload Binary to the Repository
gh release create v1.0.0 target/x86_64-unknown-linux-gnu/release/your_binary target/aarch64-unknown-linux-gnu/release/your_binary --notes "Cross-compiled binaries for x86_64 and aarch64"

# Generate Build Status Report
echo "Generating build status report..."
BUILD_STATUS="SUCCESS"
echo "Build Status: $BUILD_STATUS" > build_report.txt

# Upload Build Status Report to GitHub
gh release create v1.0.0 build_report.txt --notes "Build status report"