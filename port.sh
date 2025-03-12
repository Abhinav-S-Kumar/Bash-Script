#!/bin/bash

target=$1
start_port=$2
end_port=$3

if [ -z "$target" ] || [ -z "$start_port" ] || [ -z "$end_port" ]; then
    echo "Usage: $0 <target_ip> <start_port> <end_port>"
    exit 1
fi

if ! ping -c 1 -W 1 "$target" &> /dev/null; then
    echo "Host $target is down or unreachable."
    exit 1
fi

function port_scan {
    for ((port=$start_port; port<=$end_port; port++)); do
        (echo > /dev/tcp/"$target"/"$port") &> /dev/null && echo "Port $port is open"
    done
}

port_scan
