# Usage

This container was designed to be run as an initContainer in a kubernetes
deployment alongside gluetun. gluetun's "private internet access" provider
cannot automatically generate the necessary wireguard values, as PIA requires
logging in and generating "temporary" credentials. It will generate a wireguard
config file in /gluetun/wireguard, which gluetun will use upon startup (gluetun,
expects the file to be named wg0.conf) overriding any environment variables
passed in. This allows the needed values to be generated at runtime.

# Required environment variables

PIA_USERNAME="<your_pia_username>"

PIA_PASSWORD="<your_pia_password>"

PIA_LOC="<your preferred pia location>"

PIA_INTERFACE="wg0"

# Optional environment variables (not yet implemented)

PIA_PORTFORWARD="<any value>" # Will connect only to port-forward capable
servers, and enable port forwarding, writing the forwarded port to
/gluetun/wireguard/forwarded_port.txt. Doing something with that is up to you.
