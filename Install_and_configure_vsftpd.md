# Install and start vsftpd

Run this commands to install vsftpd:

```bash
$ sudo apt update
$ sudo apt install vsftpd
```
Now check if service is running:

```bash
$ sudo systemctl status vsftpd
```

If service is not runnig, start it:

```bash
$ sudo systemctl start vsftpd
```

And now, enable service to start on boot time:

```bash
$ sudo systemctl enable vsftpd
```

# Create and configure ftp user

1. Create a ftp user with disabled shell

```bash
$ sudo useradd -s /sbin/nologin ftpuser
$ sudo passwd ftpuser
```

2. Add ftp user to the list of allowed login users
Run the command to add the ftp user to the vsftpd.userlist file. Local users specified in this file are granted permission to access the FTP server.

```bash
$ echo "ftpuser" | sudo tee -a /etc/vsftpd.userlist
```
Add your user to vsftpd.userlist

```bash
$ echo "your_username" | sudo tee -a /etc/vsftpd.userlist
```

3. Create ftp user directory
Next, create an FTP directory for the FTP user and assign the appropriate directory permissions and ownership.

```bash
$ sudo mkdir -p /home/ftpuser/ftp_dir/upload
$ sudo chmod 550 /home/ftpuser/ftp_dir
$ sudo chmod -R 750 /home/ftpuser/ftp_dir/upload
$ sudo chown -R ftpuser: /home/ftpuser/ftp_dir
```

# Configure vsftpd

Edit the main configuration file ```/etc/vsftpd.conf```
- To disable login by the anonymous user and only grant access to the local user, set:
	```anonymous_enable=NO```
	```local_enable=YES```
- To allow the local user to upload files and gain access to their home directory, set: 
	```write_enable=YES```
	```chroot_local_user=YES```
	```allow_writeable_chroot=YES```
- You can limit the local users who can access and upload files by specifying only the users contained in the vsftpd.userlist file:
	```userlist_enable=YES```
	```userlist_file=/etc/vsftpd.userlist```
	```userlist_deny=NO```

# Generate a self-signed SSL certificate to encrypt the server

Run this command to generate the certificate:
```bash
$ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
```
- And add/edit this lines to file ```/etc/vsftpd.conf```:
	```rsa_cert_file=/etc/ssl/private/vsftpd.pem```
	```rsa_private_key_file=/etc/ssl/private/vsftpd.pem```
	```ssl_enable=YES```
   
# Restart the service

Run this commands:
```bash
$ sudo systemctl restart vsftpd
$ sudo systemctl status vsftpd
```

# Configure UFW to allow ports 20 and 21

Run this commands:
```bash
$ sudo ufw allow 20/tcp
$ sudo ufw allow 21/tcp
$ sudo ufw reload
```

# Params to connect to server from a client such as FileZilla

- Host: sftp://server-IP

- Username: ftpuser

- Password: Password of ftpuser

# Sources

[Install and configure vsftpd](https://linuxopsys.com/topics/install-vsftpd-ftp-server-on-debian?utm_content=cmp-true)