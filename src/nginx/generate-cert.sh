#!/usr/bin/env sh

# Copyright © 2022 Durudex
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

cd certs/

printf "Enter domain name: "
read domain

if [ -z "$domain" ]; then
  echo "Domain name is empty!"
  exit 1
fi

if [ -d "$domain" ]; then
  echo "Delete old certificates..."
  rm -rf $domain
fi

mkdir ./$domain

mkcert \
  -cert-file "$domain/fullchain.pem" \
  -key-file "$domain/privkey.pem" \
  $domain

cd ..
