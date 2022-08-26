#!/bin/bash

apt-get -y update
apt-get -y upgrade
apt-get -y install openjdk-11-jdk-headless maven wget

mkdir -p /work/jmulticard
cd /work/jmulticard
wget https://github.com/ctt-gob-es/jmulticard/archive/refs/tags/v1.7.tar.gz
tar xvf v1.7.tar.gz
cd */
mvn clean install -DskipTests

mkdir -p /work/clienteafirma-external
cd /work/clienteafirma-external
wget https://github.com/ctt-gob-es/clienteafirma-external/archive/refs/tags/v1.0.3.tar.gz
tar xvf v1.0.3.tar.gz
cd */
mvn clean install -DskipTests

mkdir -p /work/clienteafirma
cd /work/clienteafirma
wget https://github.com/ctt-gob-es/clienteafirma/archive/refs/tags/v1.7.2.tar.gz
tar xvf v1.7.2.tar.gz
cd */
mvn clean install -Denv=install -DskipTests
cd afirma-simple-installer/linux
tar xvf instalador_linux_deb.tar.gz
