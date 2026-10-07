#!/bin/bash
set -e

NAME="katifetch"
VERSION="13.1"
URL="https://github.com/ximimoments/katifetch/archive/refs/tags/${VERSION}.tar.gz"
TARBALL="${VERSION}.tar.gz"
SRC_DIR="${NAME}-${VERSION}"
PKG_DIR="$(pwd)/pkg"

rm -rf "$PKG_DIR" "$TARBALL" "$SRC_DIR"

echo "==> Downloading v${VERSION} from GitHub..."
curl -L -o "$TARBALL" "$URL"

echo "==> Extracting sources..."
tar -xzf "$TARBALL"

echo "==> Building and installing..."
cd "$SRC_DIR"

install -Dm755 katifetch.sh "${PKG_DIR}/usr/local/bin/katifetch"

echo "==> Package prepared in ${PKG_DIR}"
