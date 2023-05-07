# Start VM

1. Open VirtualBox Manager
2. Select VM listed in the left menu
3. Click on start button (Green arrow)

# Choose installation method

Select Install option

# Select Language, Location, locales and keymap
- Language -> English
- Location -> Other -> Europe -> Portugal
- Locales -> United States
- Keymap -> American English

# Select Hostname, Domain and root password

1. The Hostname must be your login username + 42. Ex: username42
2. Domain: leave empty
3. Choose a Password for root

# Create new user

- Full name: You can leave it empty
- Username: Your 42 login username
- Choose a password for your user

# Select country and location

# Partition disks

1. Partitioning method: Guided use entire disk and set up encrypted LVM
2. Select Separate partition for /home
3. Choose a password for the encrypted partition
4. Amount of volume group to use for guided partitioning. - write "max"
5. Click Finish Partitioning and write changes to disk
6. Partition Disks: click yes

# Package manager 

1. Configure the package manager: select no
2. Select the Debian archive mirror country: Portugal
3. Debian archive mirror: deb.debian.org
4. HTTP Proxy: leave empty
5. Participate in Survey? No

# Software selection

Select only SSH and standard system utilities

# Final steps

- Install the GRUB boot loader on a hard disk : yes
- Device for boot loader installation: /dev/sda