#!/bin/bash

# This script collects various Linux artifacts for incident response
# It requires root privileges and creates a directory named "ir_data" in the current working directory
# It uses native tools such as ps, netstat, ls, find, etc.
# It also hashes the running processes and executable files using sha256sum
# It extracts information from files and directories to create a bodyfile
# It collects user and system configuration files and logs
# It is based on the UAC project by tclahr [^1^][1]

# Create the output directory
mkdir ir_data

# Collect memory dump using avml
echo "Collecting memory dump..."
./avml ir_data/memory_dump.lime

# Collect process information
echo "Collecting process information..."
ps auxf > ir_data/ps_auxf.txt
ps -eLF > ir_data/ps_eLF.txt

# Hash the running processes and executable files
echo "Hashing the running processes and executable files..."
find /proc -maxdepth 2 -type f -name exe -exec sha256sum {} + > ir_data/process_hashes.txt
find / -type f -executable -exec sha256sum {} + > ir_data/file_hashes.txt

# Collect network information
echo "Collecting network information..."
netstat -anp > ir_data/netstat_anp.txt
netstat -rn > ir_data/netstat_rn.txt
iptables -L -n -v > ir_data/iptables.txt

# Collect file system information
echo "Collecting file system information..."
mount > ir_data/mount.txt
df -h > ir_data/df_h.txt
ls -alR / > ir_data/ls_alR.txt

# Create a bodyfile with file information
echo "Creating a bodyfile..."
find / \( -fstype rootfs -o -fstype ext4 \) -type f -exec stat --printf="%n|%s|%b|%f|%u|%g|%D|%i|%h|%t|%T|%X|%Y|%Z|%W\n" {} + > ir_data/bodyfile.txt

# Collect user information
echo "Collecting user information..."
cat /etc/passwd > ir_data/passwd.txt
cat /etc/group > ir_data/group.txt
cat /etc/shadow > ir_data/shadow.txt
last > ir_data/last.txt
lastlog > ir_data/lastlog.txt

# Collect system information
echo "Collecting system information..."
uname -a > ir_data/uname_a.txt
cat /etc/issue > ir_data/issue.txt
cat /etc/hostname > ir_data/hostname.txt
cat /etc/fstab > ir_data/fstab.txt
cat /etc/crontab > ir_data/crontab.txt
crontab -l > ir_data/crontab_l.txt
dmesg > ir_data/dmesg.txt
lspci > ir_data/lspci.txt
lsusb > ir_data/lsusb.txt

# Collect configuration files and logs
echo "Collecting configuration files and logs..."
cp -r /etc/* ir_data/etc/
cp -r /var/log/* ir_data/log/

# Compress the output directory
echo "Compressing the output directory..."
tar czvf ir_data.tar.gz ir_data

# Delete the output directory
echo "Deleting the output directory..."
rm -rf ir_data

# Print the completion message
echo "Done. The collected artifacts are in ir_data.tar.gz"
