# nginx-bulk-configurer
This script solves the problem of repetitive input of the same shell commands during the configuration of multiple domain names. The script bulk adds domain configs according to the template.
Consists of the following parts:
1) domains.txt - a file with a list of domains to be created. Domains must be entered line by line.
2) main.sh - main script. You need to give permission to run (chmod +x main.sh) and run it ./main.sh
3) example.com - template config file from which domains will be copied.
When run, the script asks if it should create directories for the created configs.
