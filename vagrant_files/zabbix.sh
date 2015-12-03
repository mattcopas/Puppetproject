sudo -i

echo '# Zabbix Application PPA' >> /etc/apt/sources.list
echo 'deb http://ppa.launchpad.net/tbfr/zabbix/ubuntu precise main' >> /etc/apt/sources.list
echo 'deb-src http://ppa.launchpad.net/tbfr/zabbix/ubuntu precise main' >> /etc/apt/sources.list

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C407E17D5F76A32B

apt-get update

debconf-set-selections <<< 'mysql-server mysql-server/root_password password netbuilder'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password netbuilder'
apt-get update
apt-get install -y zabbix-server-mysql php5-mysql zabbix-frontend-php

sed -i 's/# DBPassword=.*/DBPassword=netbuilder/' /etc/zabbix/zabbix_server.conf

cd /usr/share/zabbix-server-mysql/

gunzip *.gz

mysql -u root -pnetbuilder << EOF 
create user 'zabbix'@'localhost' identified by 'netbuilder';
create database zabbix;
grant all privileges on zabbix.* to 'zabbix'@'localhost';
flush privileges;
EOF

mysql -u zabbix -pnetbuilder zabbix < schema.sql

mysql -u zabbix -pnetbuilder zabbix < images.sql

mysql -u zabbix -pnetbuilder zabbix < data.sql

sed -i 's/post_max_size = 8M/post_max_size = 16M/g' /etc/php5/apache2/php.ini
sed -i 's/max_execution_time = 30.*/max_execution_time = 300/' /etc/php5/apache2/php.ini
sed -i 's/max_input_time = 60.*/max_input_time = 300/' /etc/php5/apache2/php.ini
sed -i 's/;date.timezone =.*/date.timezone = UTC/' /etc/php5/apache2/php.ini

cp /usr/share/doc/zabbix-frontend-php/examples/zabbix.conf.php.example /etc/zabbix/zabbix.conf.php

sed -i 's/zabbix_password/netbuilder/' /etc/zabbix/zabbix.conf.php

mkdir /etc/apache2/conf.d
cp /usr/share/doc/zabbix-frontend-php/examples/apache.conf /etc/apache2/conf.d/zabbix.conf

a2enmod alias
service apache2 restart

sed -i 's/START=no.*/START=yes/' /etc/default/zabbix-server

cp /usr/share/doc/zabbix-frontend-php/examples/apache.conf /etc/apache2/conf-available/zabbix.conf

a2enconf zabbix.conf

service apache2 reload