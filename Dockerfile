# Set the base image to use for subsequent instructions
FROM alpine:3.20

# Set the working directory inside the container
WORKDIR /tmp

RUN apk --update add jq curl wireguard-tools iproute2

LABEL \
  org.opencontainers.image.created=$CREATED \
  org.opencontainers.image.version=$VERSION \
  org.opencontainers.image.revision=$COMMIT \
  org.opencontainers.image.url="https://github.com/craquehouse/k8s-gluetun-pia-init" \
  org.opencontainers.image.documentation="https://github.com/craquehouse/k8s-gluetun-pia-init" \
  org.opencontainers.image.source="https://github.com/craquehouse/k8s-gluetun-pia-init" \
  org.opencontainers.image.title="PIA wg0.conf generation tool" \
  org.opencontainers.image.description="Uses https://github.com/triffid/pia-wg to generate a wg0.conf for use by gluetun"

ENV \
  VPN_TYPE=wireguard \
  VPN_INTERFACE=wg0

# Copy any source file(s) required for the action
COPY entrypoint.sh .
COPY pia-config.sh .

# Configure the container to be run as an executable
ENTRYPOINT ["/tmp/pia-wg.sh -c"]
