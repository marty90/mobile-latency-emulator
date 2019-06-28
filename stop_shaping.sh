#!/bin/bash

# Parse args
IFACE=$1

#Stop Shaping
tc qdisc del dev $IFACE root
