#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$ROOT_DIR"

echo "==> Restoring dependencies"
dotnet restore

echo "==> Building solution"
dotnet build --no-restore

echo "==> Build completed successfully"
