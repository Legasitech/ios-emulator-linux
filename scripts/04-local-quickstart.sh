#!/usr/bin/env bash
# Максимально простой локальный quickstart для darwin-vm пути
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "=============================================="
echo " iOS Emulator Linux — Local Quickstart"
echo "=============================================="
echo

# 1. Зависимости
if ! command -v git &>/dev/null; then
  echo "[!] git не найден. Сначала: bash scripts/00-install-deps.sh"
  exit 1
fi

echo "[1/4] Проверяю зависимости..."
bash scripts/00-install-deps.sh

echo
echo "[2/4] Клонирую research-репозитории..."
bash scripts/01-clone-research.sh

echo
echo "[3/4] Дальше два варианта:"
echo
echo "  A) С Mac (официальный путь jprx):"
echo "     cd research/darwin-vm"
echo "     ./get_files.sh"
echo "     ./fix_perms.sh firmware/ramdisk.dmg"
echo "     cd qemu-sptm && mkdir build && cd build"
echo "     ../configure --target-list=aarch64-softmmu --disable-pvg"
echo "     make -j\$(nproc)"
echo "     cd ../.. && ./run.sh"
echo
echo "  B) Без Mac (Linux/WSL порт):"
echo "     cd research/darwin-vm-windows"
echo "     bash scripts/install.sh"
echo
echo "[4/4] Читай docs/darwin-vm-guide.md для деталей."
echo
echo "Готово. Удачи."
