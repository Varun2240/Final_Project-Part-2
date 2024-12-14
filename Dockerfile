# Dockerfile for compiling source code
FROM rust:latest

# Install necessary tools for cross-compilation
RUN rustup target add x86_64-unknown-linux-gnu
RUN rustup target add aarch64-unknown-linux-gnu

# Install cross-compilation tools and dependencies
RUN apt-get update && apt-get install -y \
    gcc-aarch64-linux-gnu \
    libc6-dev-arm64-cross \
    libgcc-12-dev-arm64-cross \
    libstdc++-12-dev-arm64-cross \
    libssl-dev \
    pkg-config

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy source code
COPY . /app
WORKDIR /app

# Create .cargo/config file for linker configuration
RUN mkdir -p .cargo && echo '[target.aarch64-unknown-linux-gnu]\nlinker = "aarch64-linux-gnu-gcc"' > .cargo/config

# Compile the source code for both targets
RUN cargo build --release --target x86_64-unknown-linux-gnu
RUN cargo build --release --target aarch64-unknown-linux-gnu