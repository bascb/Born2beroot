# Install needed tools

Run this commands to install some needed tools:

```bash 
$ sudo apt install wget
$ sudo apt install tar
```

# Install WordPress

Download the latest version of Wordpress, extract it and place the contents in /var/www/html/ directory. Then clean up archive and extraction directory:

```bash
$ wget http://wordpress.org/latest.tar.gz
$ tar -xzvf latest.tar.gz
$ sudo mv wordpress/* /var/www/html/
$ rm -rf latest.tar.gz wordpress/
```

# Configure WordPress

Create WordPress configuration file:

```bash
sudo mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
```

Edit ```/var/www/html/wp-config.php``` with database info:

```
<?php
/* ... */
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_db' );

/** Database username */
define( 'DB_USER', 'admin' );

/** Database password */
define( 'DB_PASSWORD', 'WPpassw0rd' );

/** Database host */
define( 'DB_HOST', 'localhost' );
```

Change permissions of WordPress directory to grant rights to web server and restart lighttpd:

```bash
$ sudo chown -R www-data:www-data /var/www/html/
$ sudo chmod -R 755 /var/www/html/
$ sudo systemctl restart lighttpd
```

In host browser, connect to http://VM_IP and finish WordPress installation.