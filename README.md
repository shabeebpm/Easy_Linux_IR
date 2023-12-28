# Easy_Linux_IR

It contains an advanced Bash script designed for conducting digital forensics on Linux systems. The script automates the collection of a wide range of system and user data, making it an invaluable tool for digital forensic investigators.

Please note that : 
-This script collects various Linux artifacts for incident response</br>
-It requires root privileges and creates a directory named "ir_data" in the current working directory</br>
-It uses native tools such as ps, netstat, ls, find, etc.</br>
-It also hashes the running processes and executable files using sha256sum</br>
-It extracts information from files and directories to create a bodyfile</br>
-It collects user and system configuration files and logs</br>

# How to run the Script

To run the Easy_Linux_IR, follow these steps:</br>

Download the script from the repository.</br>

Give it executable permission:</br>
   **chmod +x Easy_Linux_IR.sh**</br>

Execute the script with appropriate permissions (root permissions may be required for some commands):</br>
   **sudo ./Easy_Linux_IR.sh**</br>

You can move to the folder (ir_data) and view the output files</br>

Note: You can modify the script as per your specific use case.</br>

# Contribution

Contributions to this cheatsheet are welcome. Please submit a pull request or open an issue for suggestions.</br>
