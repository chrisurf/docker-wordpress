#!/bin/bash
if [ -d /var/www/html/wp-content ]; then echo "Wordpress Ready"; else echo "Intalling Wordpress"
sudo mkdir -p /var/www/html
sudo chown www-data: /var/www/html
sudo curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /var/www/html
sudo mv /var/www/html/wordpress/* /var/www/html
rm -Rf /var/www/html/wordpress
chmod -R 777 /var/www/html; fi

# copy config files
sudo cp -R /mnt/config/php.ini /etc/php/7.4/apache2/php.ini
sudo cp -R /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf     
sudo cp -R /mnt/config/.htaccess  /var/www/html/.htaccess

# apache setup
sudo phpenmod mbstring
sudo a2enconf phpmyadmin
/etc/init.d/apache2 start

# mysql setup
if [ ! -d /mnt/db/ ]; then mkdir /mnt/db
cp -R -p /var/lib/mysql/* /mnt/db; fi
chown -R mysql:mysql /mnt/db
cp -f /mnt/config/my.cnf /etc/mysql/my.cnf
sudo usermod -d /var/lib/mysql/ mysql
sudo /etc/init.d/mysql start

# setup wordpress database and credentials
MAINDB="wordpress"
USER="wpuser"
PASSWDDB="dbpassword"
mysql -e "CREATE DATABASE ${MAINDB} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
mysql -e "CREATE USER ${USER}@localhost IDENTIFIED BY '${PASSWDDB}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MAINDB}.* TO '${USER}'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';"

tail -f /dev/null