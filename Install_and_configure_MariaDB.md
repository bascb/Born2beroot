# Install MariaDB

Run this command to install MariaDB:

```bash
$ sudo apt install mariadb-server
```

# Configure MariaDB

Start, enable and check MariaDB status:

```bash
$ sudo systemctl start mariadb
$ sudo systemctl enable mariadb
$ systemctl status mariadb
```

Then do the MySQL secure installation:

```bash
$ sudo mysql_secure_installation
```

Answer the questions like so (root here does not mean root user of VM, it's the root user of the databases!):
```
Enter current password for root (enter for none): <Enter>
Switch to unix_socket authentication [Y/n]: Y
Set root password? [Y/n]: Y
New password: 42.HelloWorld
Re-enter new password: 42.HelloWorld
Remove anonymous users? [Y/n]: Y
Disallow root login remotely? [Y/n]: Y
Remove test database and access to it? [Y/n]:  Y
Reload privilege tables now? [Y/n]:  Y
```

Restart MariaDB service:

```bash
$ sudo systemctl restart mariadb
```

# Create a database for WordPress

Enter MariaDB interface:

```bash
$ mysql -u root -p
```

Enter MariaDB root password, then create a database for WordPress:

```
MariaDB [(none)]> CREATE DATABASE wordpress_db;
MariaDB [(none)]> CREATE USER 'admin'@'localhost' IDENTIFIED BY 'WPpassw0rd';
MariaDB [(none)]> GRANT ALL ON wordpress_db.* TO 'admin'@'localhost' IDENTIFIED BY 'WPpassw0rd' WITH GRANT OPTION;
MariaDB [(none)]> FLUSH PRIVILEGES;
MariaDB [(none)]> EXIT;
```

Check that the database was created successfully, go back into MariaDB interface:

```bash
$ mysql -u root -p
```

And show databases:

```
MariaDB [(none)]> show databases;
```

You should see something like this:

```
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| wordpress_db       |
+--------------------+
```

If the database is there, everything's good!