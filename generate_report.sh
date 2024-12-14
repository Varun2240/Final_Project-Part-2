#!/bin/bash

# Variables
BUILD_STATUS="SUCCESS"
BUILD_TIME=$(date)
TARGETS="x86_64-unknown-linux-gnu, aarch64-unknown-linux-gnu"
RUST_VERSION=$(rustc --version)

# Generate HTML report
cat <<EOF > build_report.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Build Status Report</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { color: #333; }
        p { line-height: 1.6; }
        .status { font-weight: bold; color: green; }
        .failure { color: red; }
    </style>
</head>
<body>
    <h1>Build Status Report</h1>
    <p><strong>Build Status:</strong> <span class="status">$BUILD_STATUS</span></p>
    <p><strong>Build Time:</strong> $BUILD_TIME</p>
    <p><strong>Target Architectures:</strong> $TARGETS</p>
    <p><strong>Rust Version:</strong> $RUST_VERSION</p>
</body>
</html>
EOF

echo "Build report generated: build_report.html"