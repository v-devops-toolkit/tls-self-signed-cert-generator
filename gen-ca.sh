#!/usr/bin/env bash

cd ca_directory

DOMAIN=$1

openssl req -x509 -config openssl.cnf -newkey rsa:2048 -days 365 \
    -out ${DOMAIN}.cacert.pem -outform PEM -subj /CN=${DOMAIN}/ -nodes

