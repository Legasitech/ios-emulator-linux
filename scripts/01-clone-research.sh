#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
RESEARCH="$ROOT/research"
mkdir -p "$RESEARCH"
cd "$RESEARCH"

echo "[*] Cloning key research repositories into $RESEARCH ..."

clone_if_missing() {
  local name="$1"
  local url="$2"
  if [ ! -d "$name" ]; then
    echo "  → cloning $name"
    git clone --recursive "$url" "$name" || git clone "$url" "$name" || true
  else
    echo "  → $name already exists"
  fi
}

clone_if_missing "darwin-vm" "https://github.com/jprx/darwin-vm.git"
clone_if_missing "qemu-sptm" "https://github.com/jprx/qemu-sptm.git"
clone_if_missing "Inferno" "https://github.com/ChefKissInc/Inferno.git"
clone_if_missing "darwin-vm-windows" "https://github.com/thecybersandeep/darwin-vm-windows.git"

echo
echo "[+] Done. Смотри docs/darwin-vm-guide.md и docs/next-steps.md"
