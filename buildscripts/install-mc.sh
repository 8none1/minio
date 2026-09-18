#!/bin/bash
#
# Build the MinIO client (mc) and place it at the requested path.
#
# The test scripts in this repository used to download a prebuilt mc from
# dl.min.io. MinIO has taken that download site offline (it now returns
# HTTP 410 Gone for every binary), so we build mc from source via the Go
# module proxy instead. The proxy is immutable, so the pinned version below
# keeps working regardless of what happens to the upstream repository.
#
# Usage: install-mc.sh [destination]   (default: ./mc)
# Override the version with MC_VERSION=<module version or pseudo-version>.

set -euo pipefail

dest="${1:-./mc}"
# Tip of github.com/minio/mc at the time the upstream repository was archived.
version="${MC_VERSION:-v0.0.0-20251106162529-77f82e18b540}"

if [ -x "${dest}" ]; then
	exit 0
fi

gobin="$(mktemp -d)"
trap 'rm -rf "${gobin}"' EXIT

# GOFLAGS is cleared so an inherited -mod=vendor or similar cannot interfere
# with installing a module that is unrelated to the current checkout.
GOBIN="${gobin}" GOFLAGS="" go install "github.com/minio/mc@${version}"

mkdir -p "$(dirname "${dest}")"
mv "${gobin}/mc" "${dest}"
chmod +x "${dest}"
