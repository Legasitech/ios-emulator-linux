#!/usr/bin/env bash
set -euo pipefail

echo "[*] Installing dependencies for QEMU + darwin-vm research..."

sudo apt update
sudo apt install -y \
  build-essential git python3 python3-pip python3-venv \
  libpixman-1-dev libglib2.0-dev libfdt-dev libslirp-dev \
  ninja-build meson pkg-config zlib1g-dev \
  libcapstone-dev libncurses-dev libusb-1.0-0-dev \
  libgnutls28-dev libtasn1-dev cmake \
  jq curl wget unzip \
  libssl-dev flex bison

echo "[*] Installing ipsw (blacktop)..."
pip3 install --user ipsw || pip3 install --break-system-packages ipsw || true

echo
echo "[+] Basic dependencies installed."
echo "    Рекомендуется иметь ≥ 16 ГБ RAM перед сборкой QEMU."
echo "    Добавь ~/.local/bin в PATH, если ipsw не находится."
