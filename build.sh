#!/bin/bash

# This script builds a Go application, manages dependencies, and prepares for deployment

# Define variables
APP_NAME="todo_application"
BUILD_DIR="./build"
VERSION="1.0.0"

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

echo "Build process completed."
