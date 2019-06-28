#!/bin/bash

# Parse args
IFACE=$1
PROFILE=$2

# Get Profile Information
infos=$(cat profile_info.txt | awk "\$1==\"$PROFILE\"")
mu=$( echo $infos | cut -d " " -f 2)
sigma=$( echo $infos | cut -d " " -f 3)
echo "Imposing shaping for profile $PROFILE on interface $IFACE: mu=$mu, sigma=$sigma"

# Copy profile in the TC dir
cp profiles/$PROFILE  /usr/lib/tc/${PROFILE}.dist

# Add shaping
tc qdisc add dev $IFACE root netem delay ${mu}ms ${sigma}ms distribution $PROFILE


