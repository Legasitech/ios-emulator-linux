#!/usr/bin/env bash
# Пример извлечения компонентов из IPSW
# Использование: ./02-extract-ipsw.sh /path/to/file.ipsw

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <path-to-ipsw>"
  exit 1
fi

IPSW="$1"
OUT="extracted-$(basename "$IPSW" .ipsw)"
mkdir -p "$OUT"

echo "[*] Extracting key components from $IPSW ..."

# Требует установленный ipsw (blacktop)
ipsw extract -k -d -a -o "$OUT" "$IPSW" || {
  echo "[!] ipsw extract failed. Make sure 'ipsw' is installed and in PATH."
  exit 1
}

echo "[+] Extracted into $OUT"
echo "    Ищи kernelcache, DeviceTree, ramdisk и т.д."
