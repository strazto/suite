#!/bin/bash

debconf-set-selections <<< 'mysql-server mysql-server/root_password password bacon'

debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password bacon'
apt-get update --yes --force-yes

apt-get install --yes --force-yes \
  build-essential curl redis-server \
  mysql-server \
  libmysqlclient-dev default-libmysqlclient-dev \
  libffi-dev libssl-dev

printf "[client]\nuser = root\npassword = bacon" >> ~/.my.cnf

service mysql restart
mysql -e "create database dev;"
