#!/data/data/com.termux/files/usr/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive

echo "[+] Updating Termux packages..."
pkg update -y
pkg upgrade -y \
  -o Dpkg::Options::="--force-confold" \
  -o Dpkg::Options::="--force-confdef"

echo "[+] Installing required packages..."
pkg install -y \
  curl ca-certificates proot-distro \
  -o Dpkg::Options::="--force-confold" \
  -o Dpkg::Options::="--force-confdef"

echo "[+] Installing Debian (proot)..."
proot-distro install debian || true

echo "[+] Entering Debian..."
proot-distro login debian << 'EOF'
set -e
export DEBIAN_FRONTEND=noninteractive

apt update -y
apt upgrade -y \
  -o Dpkg::Options::="--force-confold" \
  -o Dpkg::Options::="--force-confdef"

apt install -y curl ca-certificates \
  -o Dpkg::Options::="--force-confold" \
  -o Dpkg::Options::="--force-confdef"

cd /root

echo "[+] Downloading Conduit (ARM64)..."
curl -L -o conduit https://github.com/ssmirr/conduit/releases/download/87cc1a3/conduit-linux-arm64
chmod +x conduit

echo "[+] Starting Conduit..."
./conduit start -m 500 -d 40
EOF

