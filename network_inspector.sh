#!/bin/bash

echo "===== LINUX NETWORK INSPECTOR ====="
echo

echo "[+] Active Network Interface:"
ip route | grep default | awk '{print $5}'
echo

echo "[+] Local IP Address:"
ip addr show $(ip route | grep default | awk '{print $5}') | grep inet | awk '{print $2}'
echo

echo "[+] Default Gateway:"
ip route | grep default | awk '{print $3}'
echo

echo "[+] DNS Resolution Test (google.com):"
dig +short google.com
echo

echo "[+] Pinging Gateway:"
ping -c 3 $(ip route | grep default | awk '{print $3}')
echo
