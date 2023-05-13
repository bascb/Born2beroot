# Install OpenSSH

Run this command to install openssh

```bash
$ sudo apt install openssh-server
```

Verify ssh

```bash
$ sudo systemctl status ssh
```

# Configure ssh port

Go to /etc/ssh and edit sshd_config.

- Change #Port22 to Port 4242
- Change #PermitRootLogin prohibit-password to PermitRootLogin no

Restart ssh service

```bash
$ sudo systemctl restart ssh