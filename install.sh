#!/data/data/com.termux/files/usr/bin/bash

set -e

echo "[+] Updating Termux..."
pkg update -y && pkg upgrade -y

echo "[+] Installing requirements..."
pkg install -y ca-certificates proot-distro

echo "[+] Installing Debian (proot)..."
proot-distro install debian || true

echo "[+] Entering Debian..."
proot-distro login debian << 'EOF'
set -e

apt update -y
apt install -y curl ca-certificates tmux

echo "[+] Downloading Conduit (ARM64)..."
cd /root
curl -L -o conduit https://github.com/ssmirr/conduit/releases/download/87cc1a3/conduit-linux-arm64
chmod +x conduit

echo "[+] Starting Conduit inside tmux..."
tmux new -d -s conduit "/root/conduit start -vv"

echo "[+] Done."
echo "[+] Attach with: tmux attach -t conduit"
EOF
