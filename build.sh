#!/usr/bin/env bash

DOMAIN=$1

./clean-dirs.sh
./init-dirs.sh ${DOMAIN}
./gen-ca.sh ${DOMAIN}
./gen-server.sh ${DOMAIN}
