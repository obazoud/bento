#!/bin/bash -eux

apt-get install -y wget curl vim git tree zip

apt-get install -y -d apache2 tomcat7 mysql-server mysql-client libmysqlclient-dev

mkdir -p /opt/apps
wget -O /opt/apps/jhipster.war http://dl.bintray.com/obazoud/generic/jhipster-0.1.war
