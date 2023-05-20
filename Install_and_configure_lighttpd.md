# Check if Apache web server is installed

Apache may be installed due to PHP dependencies. Uninstall it if it is to avoid conflicts with lighttpd:

```bash
$ systemctl status apache2
$ sudo apt purge apache2
```

# Install lighttpd

```bash
$ sudo apt install lighttpd
```

# Configure lighttpd

Start and enable lighttpd:

```bash
$ sudo systemctl start lighttpd
$ sudo systemctl enable lighttpd
$ sudo systemctl status lighttpd
```

Next, allow http port (port 80) through UFW:

```bash
$ sudo ufw allow http
$ sudo ufw status
```

Activate lighttpd FastCGI module:

```bash
$ sudo lighty-enable-mod fastcgi
$ sudo lighty-enable-mod fastcgi-php
$ sudo service lighttpd force-reload
```