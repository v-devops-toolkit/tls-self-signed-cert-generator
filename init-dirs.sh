#!/usr/bin/env bash

mkdir -p ca_directory
cp openssl.cnf ca_directory
cd ca_directory
mkdir -p certs private
chmod 700 private
echo 01 > serial
touch index.txt
