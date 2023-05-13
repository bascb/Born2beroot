# Get latest stable version of Debian

1. Got to https://www.debian.org/download and downlaod the iso file.
2. Save file in folder /sgoinfre/goinfre/Perso/<your_42_username>

# Create VM

1. Open VirtualBox and click in New (blue button)
2. Choose name for VM (Born2beroot)
3. Set Machine folder to /sgoinfre/goinfre/Perso/<your_42_username>
4. In version, select Debian(64-bit)
5. Click Next button
6. Choose the memory size (Recommended: 1024 MB)
7. Click Next button
8. Add a virtual hard disk, selecting the options that suits your needs
9. Click Create button
10. Select the hard disk file type (Recommended> VDI)
11. Click Next button
12. Select the option on how the virtaul hard disk will be stored in physical hard disk
13. Click Next button
14. Confirm or change the virtual hard disk file location
15. Select disk size (Recommended: 8 GB)
16. Click in Create button

# Select ISO file to install Debian

1. On VirtualBox Manager select Debian machine
2. Click on Settings (Orange button)
3. Select Storage
4. Click on Empty
5. Click on button with a shape of a CD (Right side of Manager window)
6. Select Choose a disk file...
7. Choose the folder where you saved your ISO file
8. Check the Live CD/DVD option
9. Click on OK button

# Configure network adapter

1. On VirtualBox Manager select Debian machine
2. Click on Settings (Orange button)
3. Select Network
4. On Adapter 1, Select  Bridged Adapter on Attached_to
