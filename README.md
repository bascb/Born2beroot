# A quick guide to create  a Virtual Machine for Born2beroot 42 project

This is a simple guide that I wrote and followed during the project.

In the following list are the steps followed, with links to guides for each step.

For this project I used VirtualBox that is installed in 42 Lisboa PC's and all VM's that I created were stored in my intranet area.
I choosed to install Debian.

List of followed steps:

## Installing the base Operating System

1. [Create VM](Create_Born2beroot_VM.md)

2. [Install OS](Install_OS.md)

Now you have you basic operating system installed.

Note: To shutdown your VM, you need to use systemctl.
Example:
```bash
$ sudo systemctl poweroff
```

## Configuring sudo and adding your user to sudo and user42 groups

3. [Install and configure sudo](Configure_sudo.md)

4. [Create user42 group and add your user](Create_user42_group.md)

## Set security configurations

5. [Set password policy](Password_policy_setup.md)

6. [Install and configure OpenSSH](Install_and_configure_ssh.md)

7. [Install and configure UFW](Install_and_configure_UFW.md)

## Create and configure monitoring script

8. [Create and configure monitoring.sh](Create_and_configure_monitoring_script.md)