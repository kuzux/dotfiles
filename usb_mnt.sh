#!/bin/bash

if [ -e usb.lock ]; then
    echo "Already inserted"
else
    sudo mount /dev/sdb1 /media/usb
    touch usb.lock
fi

