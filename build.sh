#!/usr/bin/env bash

DOMAIN=app.example.lh

./clean-dirs.sh
./init-dirs.sh
./gen-ca.sh ${DOMAIN}
./gen-server.sh ${DOMAIN}
