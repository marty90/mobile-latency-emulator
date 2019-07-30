Mobile Network Latency Emulator
===============================

Emulate mobile network latency based on large-scale real-world measurements.

This repository provides several `netem` latency profiles for emulating mobile networks. One can choose among several operators, radio access technologies and signal quality. All measurements are taken from real-world measurements, thanks to the [MONROE](https://www.monroe-project.eu/) mobile nodes. 

<!--- More details are available in the [paper](https://link/).) -->


## Available scenarios
We provide data for X operators over X countries. Moreover we provide separate scenarios for radio access technology (3G, 4G), signal strength, and whether the SIM card was in roaming.

## How data is formatted
We offer `netem` distribution files. They can be used with the `netem` tool, by copying them to the `/usr/lib/tc` directory. Note that netem distributions are normalized over average and standard deviation, and, as such, you must specify such values when using them. Our convenience scripts do this for you.

## Prerequisites
The code has been tested under Ubuntu 18.04. You only need the `tc/netem` tool which is generally installed by default.

## How to use them
You can use our convenience scripts that you find in this repository.

To start imposing latency on an interface, just run:
```
./start_shaping [interface] [profile_name]
```

To stop shaping run:
```
./stop_shaping [interface]

```

