#!/bin/bash

if [ ! -e usb.lock ]; then
    echo "Already ejected"
else
    sudo umount /dev/sdb1
    rm usb.lock
fi

