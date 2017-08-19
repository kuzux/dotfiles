#!/bin/bash

if [ -e openvpn.lock ]; then
    echo "OpenVPN already running"
else
    sudo nohup openvpn --config client1.ovpn &> /dev/null &
    echo $! > openvpn.pid
    touch openvpn.lock 
fi
