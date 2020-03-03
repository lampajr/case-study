#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#
# Exit on first error
# Obtain CONTAINER_IDS and remove them
# TODO Might want to make this optional - could clear other containers

MODE=${1:-""}

function clearContainers() {
  CONTAINER_IDS=$(sudo docker ps -a | awk '($2 ~ /dev-peer.*/) {print $1}')
  if [ -z "$CONTAINER_IDS" -o "$CONTAINER_IDS" == " " ]; then
    echo "---- No containers available for deletion ----"
  else
    echo "---- Fabric containers available for deletion ----"
    sudo docker rm -f $CONTAINER_IDS
  fi
}

# Delete any images that were generated as a part of this setup
# specifically the following images are often left behind:
# TODO list generated image naming patterns
# Copyright IBM Corp All Rights Reserved
function removeUnwantedImages() {
  DOCKER_IMAGE_IDS=$(sudo docker images | awk '($1 ~ /dev-peer.*/) {print $3}')
  if [ -z "$DOCKER_IMAGE_IDS" -o "$DOCKER_IMAGE_IDS" == " " ]; then
    echo "---- No Fabric images available for deletion ----"
  else
    echo "---- Fabric images available for deletion ----"
    sudo docker rmi -f $DOCKER_IMAGE_IDS
  fi
  if [ "$MODE" = "rmi" ]; then
    DOCKER_IMAGE_IDS=$(sudo docker images | awk '($1 ~ /bal_*/) {print $3}')
    if [ -z "$DOCKER_IMAGE_IDS" -o "$DOCKER_IMAGE_IDS" == " " ]; then
      echo "---- No BAL images available for deletion ----"
    else
      echo "---- BAL images available for deletion ----"
      sudo docker rmi -f $DOCKER_IMAGE_IDS
    fi
  fi
}

set -e

sudo docker-compose down -v
clearContainers
removeUnwantedImages