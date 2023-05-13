# Install necessary packages

Run this command to install libpam-pwquality

```bash
$ sudo apt install libpam-pwquality
```

# Configure Password policy

Go to /etc/ and edit login.defs:

- Set PASS_MAX_DAYS to 30
- Set PASS_MIN_DAYS to 2
- Set PASS_WARN_AGE to 7

Go to /etc/pam.d and edit common-password

- Set password	requisite to pam_pwquality.so retry=3
- Add ucredit=-1 to enforce at least one upper-case letter in the password
- Add lcredit=-1 to enforce at least one lower-case letter in the password
- Add dcredit=-1 to enforce at least one digit in the password
- Add minlen=10 to set the password minimum len
- Add maxrepeat=3 to allow only 3 consecutives indenticals chars in password
- Add usercheck=1 to check if the password contains the username in some form
- Add difok=7 to set a minimum number of chars that must be different from the old password
- Add enforce_for_root to enforce root password to comply to this policy

Save changes and reboot your VM