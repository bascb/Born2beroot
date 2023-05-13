# Update VM

Run the following commands to update your operating system:

```bash
$ su -
$ apt-get update -y
$ apt-get upgrade -y
```

# Install sudo

Run this command to install sudo:

```bash
$ apt install sudo
```

# Add your user to sudo group

Run this command to add your user to sudo group:

```bash
$ usermod -aG sudo <your_username>
```
And now, you can run this command to chek if your user is in sudo group:

```bash
$ getent group sudo
```

# Configure sudo policy

1. Create folder and file for sudo logs.
```bash
$ cd /var/log
$ mkdir sudo
$ cd sudo
$ touch sudo.log
```

2. Go to /etc/sudoers.d and run:

```bash
$ sudo visudo
```

Find the Defaults section and add/edit:

- To enable TTY  Defaults        requiretty
- To set log file Defaults        logfile="/var/log/sudo/sudo.log"
- To archive your log inputs and outputs  Defaults        log_input, log_output
- To set your password retries Defaults        passwd_tries=3
- To customize your bad password message Defaults        badpass_message="Your message"