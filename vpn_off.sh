#!/bin/bash

if [ ! -e openvpn.lock ]; then
    echo "OpenVPN not running"
else
    sudo kill $(cat openvpn.pid)
    rm openvpn.pid
    rm openvpn.lock 
fi
