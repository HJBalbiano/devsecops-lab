#!/usr/bin/env bash
set -e

echo "Restoring dependencies..."
dotnet restore

echo "Building solution..."
dotnet build --no-restore

echo "Build completed successfully."
