#!/bin/bash -eux

apt-get install -y wget curl vim git tree zip

apt-get install -y -d apache2 tomcat7 mysql-server mysql-client libmysqlclient-dev

mkdir -p /opt/apps
wget -O /opt/apps/jhipster.war http://dl.bintray.com/obazoud/generic/jhipster-0.3.war

export PATH=/opt/chef/embedded/bin:$PATH

export BUSSER_ROOT="/tmp/busser"
export GEM_HOME="/tmp/busser/gems"
export GEM_PATH="/tmp/busser/gems"
export GEM_CACHE="/tmp/busser/gems/cache"

gem install thor --version 0.19.0
gem install busser --version 0.6.2
#gem install busser-cucumber --version 0.1.0
gem install busser-minitest --version 0.2.0
gem install busser-bats --version 0.2.0
#gem install busser-bash --version 0.1.3
gem install busser-serverspec --version 0.2.6
#gem install busser-rspec --version 0.7.4

/tmp/busser/gems/bin/busser plugin install bats
/tmp/busser/gems/bin/busser plugin install serverspec
/tmp/busser/gems/bin/busser plugin install minitest

rsync --delete -avz /tmp/busser /opt

rm -f /etc/init.d/busser
echo "#!/bin/bash" >> /etc/init.d/busser
echo "rsync --delete -avz /opt/busser /tmp" >> /etc/init.d/busser
echo "" >> /etc/init.d/busser
chmod +x /etc/init.d/busser
update-rc.d busser defaults
