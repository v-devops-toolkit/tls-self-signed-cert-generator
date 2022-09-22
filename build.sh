#!/usr/bin/env bash


# TODO add if param is not set

DOMAIN=$1

./clean-dirs.sh
./init-dirs.sh ${DOMAIN}
./gen-ca.sh ${DOMAIN}
./gen-server.sh ${DOMAIN}
