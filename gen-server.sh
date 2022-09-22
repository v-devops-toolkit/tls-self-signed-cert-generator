#!/usr/bin/env bash

DOMAIN=$1

mkdir -p server
cd server

# the command to generate KEY file
openssl genrsa -out ${DOMAIN}.key.pem 2048

openssl req -new -key ${DOMAIN}.key.pem -out ${DOMAIN}.req.pem -outform PEM \
    -subj /CN=${DOMAIN}/O=server/ -nodes
cd ../ca_directory
openssl ca -config openssl.cnf -in ../server/${DOMAIN}.req.pem -out \
    ../server/${DOMAIN}.cert.pem -notext -batch -extensions server_ca_extensions
cd ../server

