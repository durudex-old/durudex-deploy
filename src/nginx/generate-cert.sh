#!/usr/bin/env sh

# Copyright © 2022 Durudex
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

cd certs/

if [ -f './rootCA.pem' ]; then
  echo "Delete old certificates..."
  rm *.pem
fi

printf "Enter domain name: "
read domain

if [ -z "$domain" ]; then
  echo "Domain name is empty!"
  exit 1
fi

mkcert \
  -cert-file $domain-cert.pem \
  -key-file $domain-key.pem \
  $domain

cd ..
