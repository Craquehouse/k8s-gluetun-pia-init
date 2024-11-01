#!/bin/bash

# This script runs pia-wg in config mode (-c), and copies the resulting config
# file to /gluetun/wireguard, which should be mounted as an emptyDir in the pod.

set -e

export CONFIGDIR="/app/pia-wg"

./pia-wg.sh -c

[ -e ${PIA_INTERFACE}.conf ] && cp ${PIA_INTERFACE}.conf /gluetun/wireguard

echo "Successfully generated ${PIA_INTERFACE}.conf and copied to /gluetun/wireguard"
