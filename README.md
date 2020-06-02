# backup-asterisk-azure
Simple script to make a simple backup of Asterisk folders and upload them to an Azure blob storage.
Please note this script doesn't include the web server files. Modify it to your needs.

Preparation:
1-Install rclone:
as root:  
curl https://rclone.org/install.sh | bash
non root:  
curl https://rclone.org/install.sh | sudo bash

2-before running "rclone config", create Azure Storage Account as in this page (a little outdated):  
https://www.wintellect.com/using-rclone-with-azure-for-a-low-cost-backup/
Use this page up to just before the "Syncing a Directory" section. 
For the Azure directory name I use the hostname of the asterisk system I'm backing up.

3- create /var/backups directory

4- Place the script there.

5- chmod +x /var/backups/backup-asterisk.sh

6- crontab -e
insert the line:
0 0 1 * * /var/backups/backup-asterisk.sh 

For assistance with the crontab schedule syntax, use the page:  
https://crontab.guru/

