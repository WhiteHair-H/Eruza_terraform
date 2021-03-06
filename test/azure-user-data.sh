#!/bin/bash
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install -y yum-utils
yum-config-manager --enable remi-php74
yum-config-manager --disable remi-php54
yum install -y php php-cli php-mysql httpd mysql
yum install -y wget
wget https://ko.wordpress.org/latest-ko_KR.tar.gz
tar xvfz latest-ko_KR.tar.gz 
cp -a wordpress/* /var/www/html/
chown apache.apache /var/www/html/*
sed -i 's/DirectoryIndex index.html/DirectoryIndex index.html index.php/g' /etc/httpd/conf/httpd.conf
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i 's/database_name_here/wordpress/g' /var/www/html/wp-config.php
sed -i 's/username_here/haha@jinwoo-db-server/g' /var/www/html/wp-config.php
sed -i 's/password_here/It12345!/g' /var/www/html/wp-config.php
sed -i 's/localhost/jinwoo-db-server.mysql.database.azure.com/g' /var/www/html/wp-config.php
systemctl restart httpd
systemctl enable httpd