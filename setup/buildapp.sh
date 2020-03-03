#! /bin/bash
#
# Copyright Ghareeb Falazi Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#
# Exit on first error

set -e

printf "\n---Building Maven...---\n"

cd ../client/java
mvn package -DskipTests=true

printf "\n---Copying executables...---\n"

#cp -r frontend/dist ../../AutomateSetup/client-app/frontend
cp -r backend/target ../../setup/client-app/java-backend/target
cp -r ../nodejs/* ../../setup/client-app/nodejs-backend/target

printf "\n---DONE!---\n"