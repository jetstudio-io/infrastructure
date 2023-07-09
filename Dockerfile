FROM ubuntu:22.04
LABEL authors="louis.nguyen@jetstudio.io"

#### Install buildah
RUN apt update && apt install -y buildah ca-certificates

#### Copy action script to the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]