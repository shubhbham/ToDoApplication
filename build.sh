#!/bin/bash

# This script builds a Go application, manages dependencies, and prepares for deployment

# Define variables
APP_NAME="todo_application"
BUILD_DIR="./build"
VERSION="1.0.0"
DOCKER_IMAGE_NAME="todo_application:latest"

# Function to build the Go application
build() {
    echo "Building $APP_NAME..."
    go build -o "$BUILD_DIR/$APP_NAME" .
    echo "Build complete."
}

# Function to manage Go dependencies
install_dependencies() {
    echo "Installing dependencies..."
    go mod download
    echo "Dependencies installed."
}

# Function to package the application (example: create a tarball)
package_app() {
    echo "Packaging $APP_NAME..."
    tar -czf "$BUILD_DIR/$APP_NAME-$VERSION.tar.gz" -C "$BUILD_DIR" "$APP_NAME"
    echo "Packaging complete: $BUILD_DIR/$APP_NAME-$VERSION.tar.gz"
}

# Function to build the Docker image
build_docker_image() {
    echo "Building Docker image $DOCKER_IMAGE_NAME..."
    docker build -t "$DOCKER_IMAGE_NAME" .
    echo "Docker image build complete."
}

# Main script flow
echo "Starting build process..."

# Ensure the build directory exists
mkdir -p "$BUILD_DIR"

# Install dependencies
install_dependencies

# Build the application
build

# Package the application (optional)
package_app

# Build Docker image
build_docker_image

echo "Build process completed."
