# A quick guide to create  a Virtual Machine for Bor2beroot 42 project

This is a simple guide that I wrote and followed during the project

In the following list are the steps I followed, with links to guides for each step.

For this project I used VirtualBox that is installed in 42 Lisboa PC's and all VM's that I created were stored in my intranet area.
I choosed to install Debian.

List of folloed steps:

## Installing the base Operating System

1. [Create VM](Create_Born2beroot_VM.md)

2. [Install OS](Install_OS.md)

Now you have you basic operating system installed.

Note: To shutdown your VM, you need to use systemctl.
Example:
```bash
$ sudo systemctl poweroff
```

## Configuring sudo and adding your user to sudo group

3. [Install and configure sudo](Configure_sudo.md)