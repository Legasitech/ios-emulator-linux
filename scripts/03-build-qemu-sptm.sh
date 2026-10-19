#!/usr/bin/env bash
# Попытка собрать qemu-sptm (нужно много RAM!)
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
QEMU_DIR="$ROOT/research/qemu-sptm"

if [ ! -d "$QEMU_DIR" ]; then
  echo "[!] Сначала запусти scripts/01-clone-research.sh"
  exit 1
fi

cd "$QEMU_DIR"

echo "[*] Configuring qemu-sptm..."
mkdir -p build
cd build

../configure \
  --target-list=aarch64-softmmu \
  --disable-pvg \
  --disable-werror \
  || {
    echo "[!] configure failed"
    exit 1
  }

echo "[*] Building (это может занять много времени и памяти)..."
make -j"$(nproc)" || make -j2 || make

echo
echo "[+] Build finished (если не упало по OOM)."
echo "    Бинарник: $QEMU_DIR/build/qemu-system-aarch64"
