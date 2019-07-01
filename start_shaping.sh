#!/bin/bash

# Parse args
IFACE=$1
PROFILE=$2

# Check number of arguments
if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters."
    echo "Usage: ./start_shaping.sh [INTERFACE] [PROFILE]"
    exit 1
fi

# Check interface exists
found=$( ifconfig  | grep Link | cut -d " " -f 1 | grep $IFACE)
if [ -z $found ]
then
      echo "Error: interface $IFACE does not exist. Quitting..."
      exit 1
fi

# Check profile exists
found=$( ls profiles  | awk "\$1 == \"$PROFILE\" ")
if [ -z $found ]
then
      echo "Error: profile $PROFILE does not exist. Quitting..."
      exit 1
fi

# Get Profile Information
infos=$(cat profile_info.txt | awk "\$1==\"$PROFILE\"")
mu=$( echo $infos | cut -d " " -f 2)
sigma=$( echo $infos | cut -d " " -f 3)
echo "Imposing shaping for profile $PROFILE on interface $IFACE: mu=$mu, sigma=$sigma"

# Copy profile in the TC dir
cp profiles/$PROFILE  /usr/lib/tc/${PROFILE}.dist

# Add shaping
tc qdisc add dev $IFACE root netem delay ${mu}ms ${sigma}ms distribution $PROFILE


