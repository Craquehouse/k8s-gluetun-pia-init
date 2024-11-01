# Set the base image to use for subsequent instructions
FROM alpine:3.20

WORKDIR /app

# Add required packages
RUN apk --update add jq curl wireguard-tools iproute2 git

# clone upstream repo
RUN git clone https://github.com/triffid/pia-wg.git

# make config output directory
RUN mkdir -p /gluetun/wireguard

# Environment
#ENV \
#  VPN_TYPE=wireguard \
#  VPN_INTERFACE=wg0

# Copy any source file(s) required for the action
#COPY pia-wg.sh .
#COPY pia-config.sh .

# Configure the container to be run as an executable
ENTRYPOINT ["/app/pia-wg/pia-wg.sh"]
CMD ["-c"]

# Labels
LABEL \
  org.opencontainers.image.created=$CREATED \
  org.opencontainers.image.version=$VERSION \
  org.opencontainers.image.revision=$COMMIT \
  org.opencontainers.image.url="https://github.com/craquehouse/k8s-gluetun-pia-init" \
  org.opencontainers.image.documentation="https://github.com/craquehouse/k8s-gluetun-pia-init" \
  org.opencontainers.image.source="https://github.com/craquehouse/k8s-gluetun-pia-init/USAGE.md" \
  org.opencontainers.image.title="PIA wg0.conf generation tool" \
  org.opencontainers.image.description="Uses https://github.com/triffid/pia-wg to generate a wg0.conf for use by gluetun"

