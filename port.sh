#!/bin/bash

# Simple Port Scanner
# Usage: ./port_scanner.sh <target_ip>

echo "Usage: ./port-scanner.sh [IP]"
echo

if [ "$1" = "" ]; then
  echo "Usage: ./port-scanner.sh [IP]"
else
  target_ip=$1
  echo "Scanning ports for $target_ip..."
  nc -nvz $target_ip 1-65535 > "$target_ip.txt" 2>&1
  tac "$target_ip.txt"
  rm -rf "$target_ip.txt"
fi
