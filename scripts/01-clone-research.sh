#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
RESEARCH="$ROOT/research"
mkdir -p "$RESEARCH"
cd "$RESEARCH"

echo "[*] Cloning key research repositories..."

if [ ! -d darwin-vm ]; then
  git clone --recursive https://github.com/jprx/darwin-vm.git
fi

if [ ! -d qemu-sptm ]; then
  # уже submodule в darwin-vm, но клонируем отдельно на всякий
  git clone https://github.com/jprx/qemu-sptm.git || true
fi

if [ ! -d Inferno ]; then
  git clone https://github.com/ChefKissInc/Inferno.git || true
fi

if [ ! -d darwin-vm-windows ]; then
  git clone https://github.com/thecybersandeep/darwin-vm-windows.git || true
fi

echo "[+] Research repos are in $RESEARCH"
echo "    Дальше читай docs/next-steps.md"
