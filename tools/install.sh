#!/bin/bash
# Install HexStrike custom tools to PATH
# Usage: ./tools/install.sh

TOOLS_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTALL_DIR="/usr/local/bin"

echo "[*] Installing HexStrike custom tools from $TOOLS_DIR"

TOOLS=(
    hash-identifier
    jwt-analyzer
    qsreplace
    uro
    httpie
    checksec
    searchsploit
    graphql-scanner
    api-schema-analyzer
    arjun
    paramspider
    hakrawler
    xsser
    dotdotpwn
    sherlock
    theharvester
)

installed=0
for tool in "${TOOLS[@]}"; do
    if [ -f "$TOOLS_DIR/$tool" ]; then
        chmod +x "$TOOLS_DIR/$tool"
        ln -sf "$TOOLS_DIR/$tool" "$INSTALL_DIR/$tool"
        installed=$((installed + 1))
    else
        echo "[!] Missing: $tool"
    fi
done

echo "[+] Installed $installed/${#TOOLS[@]} tools to $INSTALL_DIR"
echo "[*] Verify with: which hash-identifier jwt-analyzer checksec"
