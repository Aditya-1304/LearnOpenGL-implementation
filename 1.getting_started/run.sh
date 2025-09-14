#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./run.sh            # configure, build, run
#   ./run.sh clean      # remove build/ then configure, build, run
#   BUILD_TYPE=Release ./run.sh

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="$ROOT_DIR/build"
BUILD_TYPE="${BUILD_TYPE:-Debug}"

if [[ "${1:-}" == "clean" ]]; then
  rm -rf "$BUILD_DIR"
fi

cmake -S "$ROOT_DIR" -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE="$BUILD_TYPE"
cmake --build "$BUILD_DIR" -j"$(nproc)"

cd "$BUILD_DIR"
exec ./my_app