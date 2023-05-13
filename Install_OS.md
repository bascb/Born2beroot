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

## Partition disk
1. Partitioning method: Manual
2. Select your hard disk sda ... 8.6 GB ATA VBOX...
3. Create new empty partition table on this device -> yes
4. Select pri/log 8.6 GB
5. Select: Create a new partition
6. Partition size: 500 MB
7. Select Primary -> Beginning
8. Mount point: /boot
9. Select Done setting up the partition
10. Select pri/log ...
11. Select: Create a new partition
12. Partition size: max
13. Select Logical
14. Select Done setting up the partition
15. Select Configure encrypted volumes
16. Click Yes
17. Select Create encrypted volumes
18. Select /dev/sda5 (Click space bar) and click enter
19. Select Done setting up the partition
20. Select Finish
21. Click Yes
## Create volume group
22. Write the encryption password twice
23. Select Configure the Logical Volume Manager
24. Select Yes
25. Select Create volume group
26. Write LVMGroup
27. Press space on /dev/mapper/sda5_crypt
28. Continue
29. Select Create logical volume
30. Select LVMGroup
31. Write root
32. Write 2 GB
33. Repeat steps 29 -> 32 for:
   - swap - 1 GB
   - home - 1 GB
   - var - 1 GB
   - srv - 1 GB
   - tmp - 1 GB
   - var-log - all disk space that left
34. Select Finish
35. Now u see "[!!] Partition disks" window and a lot of LVM VG LVMGroup LV ...  |
| Go to first #1 998.2 MB (under home, <volumename> #1 for next steps) ->      |
|-> Use as (UA next): -> EXT4 jfl -> Mount point: (MP next) -> /home ->        |
|-> Done setting up the partition (yep, DSUP)                                  |
| root #1 -> UA -> ext4 -> MU -> / - the root fs -> DSUP                       |
| srv #1 -> UA -> ext4 -> MU -> /srv -> DSUP                                   |
| swap #1 -> UA -> swap area -> DSUP                                           |
| tmp #1 -> UA -> ext4 -> MU -> /tmp -> DSUP                                   |
| var #1 -> UA -> ext4 -> MU -> /var -> DSUP                                   |
| var-log #1 -> UA -> ext4 -> MU -> Enter manually -> /var/log -> DSUP         |
| Scroll below -> Finish partitioning and write changes to disk -> yes 

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