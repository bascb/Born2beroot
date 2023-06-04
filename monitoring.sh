#! /usr/bin/bash


# Getting the architecture of the operating system and its kernel version
ARCHITECTURE=$(uname -a)

# Getting the number of physical processors and virtual processors of your VM.
#
# First of all, we need to now the difference between physical processor, core and virtual processor (Source Chat GPT)
# - Physical processor: 
# A physical processor, also known as a central processing unit (CPU), is a hardware component of a computer 
# system that carries out instructions and performs calculations. It is often referred to as the "brain" of the computer because 
# it performs the majority of the computational tasks required for the system to function.
# A physical processor consists of one or more processor cores, each capable of executing instructions independently. 
# Each core contains an arithmetic logic unit (ALU), control unit, and cache memory. The ALU performs mathematical and logical operations, 
# while the control unit manages the flow of instructions and data within the processor.
# - Processor Core: 
# Is a fundamental processing unit within a physical processor. It is an individual processing unit capable of executing instructions independently.
# Each core has its own arithmetic logic unit (ALU), control unit, and cache memory. Multiple cores within a physical processor allow for parallel 
# processing and increased performance.
# - What is the difference between a physical processor and a core?
# A physical processor and a core are related but distinct concepts in the context of computer hardware.
# A physical processor, as I mentioned earlier, refers to the entire hardware component responsible for executing instructions and performing calculations 
# in a computer system. It includes multiple cores, cache memory, and other components necessary for its operation.
# A core, on the other hand, is a fundamental processing unit within a physical processor.
# To put it simply, a physical processor is the overall hardware component that contains one or more cores. 
# Each core is a separate processing unit within the physical processor capable of executing instructions independently.
# - Virtual processor:
# Is a software abstraction of a physical processor within a virtualized environment. 
# It allows multiple virtual machines to run concurrently on a single physical machine, enabling efficient utilization of hardware resources.
#
# How to determine the number of physical processors?
# Method 1: Using the proc filesystem:
PHYSICAL_CPU_1=$(grep "physical id" /proc/cpuinfo | sort | uniq | wc -l)
# Method 2: Using the lscpu command:
PHYSICAL_CPU_2=$(lscpu | grep "Socket(s)" | awk '{print $2}')
# How to determine the number of virtual processors?
# Method 1: Using the proc filesystem:
VIRTUAL_CPU_1=$(grep "processor" /proc/cpuinfo | wc -l)
# Method 2: Using the lscpu command:
VIRTUAL_CPU_2=$(lscpu | grep "^CPU(s):" | awk '{print $2}')

# Obtaining the used RAM memory and its utilization rate as a percentage
#
# The script uses free, a software that displays  the  total amount of free and used physical and swap memory in the system,
# as well as the buffers and caches used by the kernel. The information is gathered by parsing /proc/meminfo.
# free -m - Displays memory in MB
# grep Mem - Displays only the line containing the amount of physical memory
# awk '{print $3}' - Displays only the third column
USED_RAM=$(free -m | grep Mem | awk '{print $3}')
TOTAL_RAM=$(free -m | grep Mem | awk '{print $2}')
RAM_USAGE_PERCENTAGE=$(echo "$USED_RAM $TOTAL_RAM" | awk '{printf("%.2f"), $1/$2*100}')

# Obtaining the used disk memory and its utilization rate as a percentage
#
# The script uses df, a software that displays the amount of disk space available on the file system.
# df -Bm - Prints Block size in MB
# grep '^/dev/' - Prints only branches directories from dev
# awk '{udisk += $3} END {print fdisk}' - Sums all used space in all listed directories and prints final value
USED_DISK=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{udisk += $3} END {print udisk}')
TOTAL_DISK=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{tdisk += $2} END {print tdisk}')
DISK_USAGE_PERCENTAGE=$(echo "$USED_DISK $TOTAL_DISK" | awk '{printf("%.2f"), $1/$2*100}')

# Getting the current utilization rate of VM processors as a percentage.
#
# The script uses top, a software that provides a dynamic real-time view of a running system.
# top -bn1 - Runs only one iteration
# grep '^%Cpu' - Prints only the line that starts by %Cpu
# awk '{printf("%.1f%%"), $2 + $4}' Prints the sum of userspace CPU usage and system(kernel space) CPU usage
CPU_USAGE_PERCENTAGE=$(top -bn1 | grep '^%Cpu' | awk '{printf("%.1f"), $2 + $4}')

# Getting the date and time of the last reboot
#
# The script uses who, a software that shows who is logged on
# who -b - Displays the date of lat system boot
# awk '{print $3 " " $4}' - Prints only the date an time of last system boot
LAST_BOOT=$(who -b | awk '{print $3 " " $4}')

# Check if LVM is active
#
# The script uses lsblk, a program that lists information about all available or specified block devices.
# grep 'lvm' - Prints only block devices of lvm type
# awk '{if ($1) {printf "\033[0;32mYes\033[0m";exit} else {print "\033[0;031mNo\033[0m";exit;}}' - if exists output, than it means that lvm is active
LVM_ACTIVE=$(lsblk | grep 'lvm' | awk '{if ($1) {printf "\033[0;32mYes\033[0m";exit} else {print "\033[0;031mNo\033[0m";exit;}}')

# Getting the number of active connections
#
# The script uses ss, a program that dump socket statistics.
# ss -t - Displays only TCP sockets
# grep ESTAB - Prints only established connections
# wc -l - count printed lines
ACTIVE_CONNECTIONS=$(ss -t | grep ESTAB | wc -l)

# Getting the number of users using the server.
#
# The script uses who, a software that shows who is logged on.
LOGGED_USERS=$(who | wc -l)

# Getting the IPv4 address of VM and its MAC (Media Access Control) address
#
# The script uses hostname, a program that shows or set the system's host name,  and ip, a program that 
# show / manipulate routing, network devices, interfaces and tunnels
# hostname -I - Display all network addresses of the host
IPV4=$(hostname -I)
# ip link show - show all network interfaces
# grep ether - prints only the ethernet data
# awk '{print $2}' prints only the column with MAC address
MAC_ADDRESS=$(ip link show | grep ether | awk '{print $2}')

# Getting the number of commands executed with the sudo program
#
# The script uses journalctl, a program that queries the systemd journal
SUDO_N_COMMANDS=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

# Wall explanation
wall "  #Architecture: $ARCHITECTURE
        #CPU physical: $PHYSICAL_CPU_2
        #vCPU: $VIRTUAL_CPU_2
        #Memory Usage: ${USED_RAM}MB/${TOTAL_RAM}MB ($RAM_USAGE_PERCENTAGE%)
        #Disk Usage: ${USED_DISK}MB/${TOTAL_DISK}MB ($DISK_USAGE_PERCENTAGE%)
        #CPU load: $CPU_USAGE_PERCENTAGE%
        #Last boot: $LAST_BOOT
        #LVM use: $LVM_ACTIVE
        #Connections TCP: $ACTIVE_CONNECTIONS ESTABLISHED
        #User log: $LOGGED_USERS
        #Network: IP $IPV4 ($MAC_ADDRESS)
        #Sudo: $SUDO_N_COMMANDS cmd"