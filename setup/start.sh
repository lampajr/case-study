#! /bin/bash
#
# Copyright Andrea Lamparelli Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#
# Exit on first error
# Obtain CONTAINER_IDS and remove them

set -e

printf "\n---Copying Ethereum smart contract to working directory of ganache-cli docker images...---\n"

cp -r ../smartcontracts/ethereum/Seafood ./ganache-cli/Seafood

printf "\n---Bringing up docker images...---\n"

sudo docker-compose up -d

sleep 1
printf "\n---Sleeping 10s to allow blockchains to complete booting...---\n"

sleep 9
printf "\n---Deploying the Seafood smart contract on the ganache Ethereum simulator...---\n"

sudo docker exec ganache-with-truffle truffle migrate

printf "\n---Installing the Dairy Fabric smart contract on peer0.org1.example.com---\n"

chmod +x fabric/scripts/script.sh
sudo docker exec cli scripts/script.sh

printf "\n---Cleaning up...---\n"

rm -rf ./ganache-cli/Seafood

printf "\n---DONE!---\n"