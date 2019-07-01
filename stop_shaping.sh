#!/bin/bash

# Parse args
IFACE=$1

# Check number of arguments
if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters."
    echo "Usage: ./stop_shaping.sh [INTERFACE]"
    exit 1
fi

# Check interface exists
found=$( ifconfig  | grep Link | cut -d " " -f 1 | grep $IFACE)
if [ -z $found ]
then
      echo "Error: interface $IFACE does not exist. Quitting..."
      exit 1
fi

#Stop Shaping
tc qdisc del dev $IFACE root
