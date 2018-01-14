#!/usr/bin/env bash

mkdir -p ca_directory

cat openssl.cnf | sed -e "s/app.example.lh/${1}/g" > ca_directory/openssl.cnf
cd ca_directory
mkdir -p certs private
chmod 700 private
echo 01 > serial
touch index.txt
