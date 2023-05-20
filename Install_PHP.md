# Install PHP

Run this commands to get the latest version of PHP:

```bash
$ sudo apt update
$ sudo apt install curl
$ sudo curl -sSL https://packages.sury.org/php/README.txt | sudo bash -x
$ sudo apt update 
```

Now, install PHP version 8.2:

```bash
$ sudo apt install php8.2
$ sudo apt install php-common php-cgi php-cli php-mysql
```

And check PHP version:

```bash
$ php -v
```