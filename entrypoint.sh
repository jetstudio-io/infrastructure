#!/bin/bash -l
### Assign input args to the variables
DOCKER_FILE=$1
DOCKER_REPOSITORY=$2
DOCKER_IMAGE=$3
DOCKER_TAG=$4
ARCH=$5
### manifest name
MANIFEST_NAME="multi-arch"

### Print script args to debug
echo "$@"

### Go to working dir
cd /github/workspace
ls -la

### Build amd64 & arm64 image by default if not preset
if [ -z "$ARCH" ]
then
  ARCH="amd64,arm64"
fi
### Split arch to allow build multi-arch
IFS=',' read -r -a ARCHES <<< "$ARCH"

### Login to docker.io & create manifest to build multi-arch
buildah login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD} docker.io
#buildah manifest create ${MANIFEST_NAME}

for ARCH in "${ARCHES[@]}"
do
  echo "$ARCH"
#  buildah build \
#    --tag "docker.io/${DOCKER_REPOSITORY}/${DOCKER_IMAGE}:${DOCKER_TAG}" \
#    --manifest ${MANIFEST_NAME} \
#    --arch "$ARCH"
#    ${DOCKER_BUILD_ARGS}
#    ${DOCKER_FILE}
done

### Push to hub.docker.io
#buildah manifest push --all ${MANIFEST_NAME} "docker://docker.io/${DOCKER_REPOSITORY}/${DOCKER_IMAGE}:${DOCKER_TAG}"