# Create monitoring.sh script

You can use my monitoring.sh as example to create your own monitoring script.

To create your script you have two options:
1. Create your script in your VM
2. Create your script in your 42 intranet area (Or in your machine, if you are using your PC) and then copy it to your VM.

I used the second option, with scp:

1. Start your VM (if it is turned off)
2. In machine where you created your script, follow this command example:
```bash
$ scp -P 4242 path/to/your/script/monitoring.sh <vm login>@<vm IP>:path/to/desired/folder
```

# Configure script to run every 10 minutes

1. Copy monitoring.sh to /usr/local/bin/
2. Give execution permission to script: ```bash $ chmod 777 /usr/local/bin/monitoring.sh```