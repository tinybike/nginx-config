#!/bin/bash

sudo apt-get install mongodb libssl-dev libpcre3-dev -y

ldd `which openssl`

cd ~

git clone https://github.com/minhajuddin/nginx-mongodb-rest

cd nginx-mongodb-rest

git submodule init
git submodule update

cd ~

wget http://nginx.org/download/nginx-1.9.4.tar.gz
tar -xzvf nginx-1.9.4.tar.gz

./configure --add-module=~/nginx-mongodb-rest --with-http_ssl_module
make
sudo make install

/usr/local/nginx/sbin/nginx -v
