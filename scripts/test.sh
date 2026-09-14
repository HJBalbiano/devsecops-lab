#!/usr/bin/env bash
set -e

echo "Running tests..."
dotnet test --no-build

echo "Tests completed successfully."
