# Easy_Linux_IR

It contains an advanced Bash script designed for conducting digital forensics on Linux systems. The script automates the collection of a wide range of system and user data, making it an invaluable tool for digital forensic investigators.

# How to run the Script

To run the Easy_Linux_IR, follow these steps:

Download the script from the repository.

Give it executable permission:
   **chmod +x IRLinux_Script.sh**

Execute the script with appropriate permissions (root permissions may be required for some commands):
   **sudo ./Easy_Linux_IR.sh**

# This script collects various Linux artifacts for incident response
# It requires root privileges and creates a directory named "ir_data" in the current working directory
# It uses native tools such as ps, netstat, ls, find, etc.
# It also hashes the running processes and executable files using sha256sum
# It extracts information from files and directories to create a bodyfile
# It collects user and system configuration files and logs

Note: You can modify the script as per your specific use case.

# Contribution

Contributions to this cheatsheet are welcome. Please submit a pull request or open an issue for suggestions.
