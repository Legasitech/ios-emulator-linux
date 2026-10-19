#!/usr/bin/env bash
set -euo pipefail

echo "[*] Installing build dependencies for QEMU + research tools..."

sudo apt update
sudo apt install -y \
  build-essential git python3 python3-pip \
  libpixman-1-dev libglib2.0-dev libfdt-dev libslirp-dev \
  ninja-build meson pkg-config zlib1g-dev \
  libcapstone-dev libncurses-dev libusb-1.0-0-dev \
  libgnutls28-dev libtasn1-dev cmake \
  jq curl wget unzip

echo "[*] Installing ipsw (blacktop)..."
pip3 install --user ipsw || true

echo "[+] Dependencies installed."
echo "    Make sure ~/.local/bin is in your PATH if needed."
