#!/usr/bin/env bash

_clean_dirs() {
  rm -rf ca_directory
  rm -rf server
}

_init_dirs() {
  mkdir -p ca_directory
  cat openssl.cnf.template | sed -e "s/XXX-TEMPLATE-DOMAIN-XXX/${1}/g" >ca_directory/openssl.cnf
  mkdir -p ca_directory/certs
  mkdir -p ca_directory/private
  chmod 700 ca_directory/private
  echo 01 >ca_directory/serial
  touch ca_directory/index.txt
}

_gen_ca() {
  (
    # the script needs to enter ca_directory
    # because config file openssl.cnf contains relative paths
    cd ca_directory

    openssl req -x509 \
      -config openssl.cnf \
      -newkey rsa:2048 \
      -days 365 \
      -out "${1}.cacert.pem" \
      -outform PEM \
      -subj "/CN=${1}/" \
      -nodes
  )
}

_gen_server() {

  mkdir -p server

  # generate the key file
  openssl genrsa -out "server/${1}.key.pem" 2048

  openssl req \
    -new \
    -key "server/${1}.key.pem" \
    -out "server/${1}.req.pem" \
    -outform PEM \
    -subj "/CN=${1}/O=server/" \
    -nodes

  (
    # the script needs to enter ca_directory
    # because config file openssl.cnf contains relative paths
    cd ca_directory
    openssl ca \
      -config openssl.cnf \
      -in "../server/${1}.req.pem" \
      -out "../server/${1}.cert.pem" \
      -notext \
      -batch \
      -extensions server_ca_extensions
  )

  rm "server/${1}.req.pem"
}

if ! [ -x "$(command -v openssl)" ]; then
  echo "Command not found: openssl"
  exit 1
fi

if [ $# -eq 0 ]; then
  echo Missing required parameter: domain
  exit 2
fi

_clean_dirs
_init_dirs "${1}"
_gen_ca "${1}"
_gen_server "${1}"
