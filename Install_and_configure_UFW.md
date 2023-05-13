# Install UFW

Run this command to install UFW>

```bash
$ sudo apt install ufw
```

# Configure UFW

Enable ufw:

```bash
$ sudo ufw enable
$ sudo ufw status
```

Allow port 4242 on firewall:

```bash
$ sudo ufw allow 4242/tcp
$ sudo ufw status
```