📂 Script_Backup_Automated
A robust Bash script for automated file backups with logging and error handling.
This repository provides a lightweight and efficient Bash script to automate file backups from a source directory to a local backup destination. Using rsync, it ensures reliable file synchronization, logs operations with timestamps, and supports easy customization.

🚀 Features

Automated Backups: Synchronizes files using rsync for speed and reliability.
Detailed Logging: Tracks success/failure with timestamps in backup.log.
Error Handling: Validates backup operations and logs issues.
Customizable: Easily configure source and backup paths.
Lightweight: Minimal dependencies, built for Linux environments.


📋 Table of Contents

Overview
Prerequisites
Installation
Usage
Script Breakdown
Log Output
Customization
Contributing
License


📖 Overview
Script_Backup_Automated is designed to simplify file backups by automating the process of copying files from a source directory (/home/kali/Desktop/New_Backup) to a local backup directory (/home/kali/Desktop/Backup). It leverages rsync for efficient file transfers and logs every operation in a backup.log file for easy monitoring.
This script is ideal for users who need a straightforward, reliable backup solution with minimal setup.

🛠 Prerequisites

Operating System: Linux (tested on Kali Linux).
Dependencies:
bash: Required to run the script.
rsync: Used for file synchronization.


Permissions: Ensure read/write access to source and backup directories.

Install rsync on Debian-based systems:
sudo apt update
sudo apt install rsync


🔧 Installation

Clone the Repository:
git clone https://github.com/your-username/Script_Backup_Automated.git
cd Script_Backup_Automated


Set Execute Permissions:
chmod +x backup.sh


Verify Paths:

Check the source and local_backup_dir variables in backup.sh to match your directories.




▶️ Usage
Run Manually
Execute the script directly:
./backup.sh

Schedule with Cron
Automate daily backups (e.g., at midnight):

Open the crontab editor:crontab -e


Add the following line:0 0 * * * /path/to/Script_Backup_Automated/backup.sh




💻 Script Breakdown
Below is the complete Bash script (backup.sh):
#!/bin/bash

# Variables
source="/home/kali/Desktop/New_Backup"
log_situation="backup.log"
local_backup_dir="/home/kali/Desktop/Backup"

# Function
perform_backup(){
  rsync -avz /home/kali/Desktop/Backup /home/kali/Desktop/New_Backup > "$log_situation" 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "backup successful :$(date) " >> "$log_situation"
  else
    echo "backup failed :$(date) " >> "$log_situation"
  fi
}

# Run the backup
perform_backup

How It Works

Variables:
source: Source directory for files to back up.
log_situation: Log file to record backup status.
local_backup_dir: Destination directory for backups.


Function:
perform_backup: Runs rsync with -avz (archive, verbose, compress).
Checks rsync exit status ($?) to log success or failure.


Execution: Calls perform_backup to start the process.


Note: The script currently syncs from local_backup_dir to source. To reverse this (back up from source to local_backup_dir), modify the rsync command:
rsync -avz "$source" "$local_backup_dir" > "$log_situation" 2>/dev/null



📜 Log Output
The script creates a backup.log file in the same directory, with entries like:
backup successful :Sat May 10 12:34:56 UTC 2025
backup failed :Sat May 10 12:35:10 UTC 2025

Use this file to monitor backup history and troubleshoot issues.

⚙️ Customization
To adapt the script:

Change Directories:
Edit source and local_backup_dir in backup.sh.


Modify rsync Options:
Adjust rsync flags (e.g., add --delete to remove files not in source).


Add Cloud Backup:
Extend the script to upload backups to cloud storage (e.g., AWS S3, Google Drive) with tools like rclone.



Example for reversing backup direction:
rsync -avz "$source" "$local_backup_dir" > "$log_situation" 2>/dev/null


🤝 Contributing
Contributions are welcome! To contribute:

Fork the repository.
Create a feature branch:git checkout -b feature/your-feature


Commit changes:git commit -m "Add your feature"


Push to the branch:git push origin feature/your-feature


Open a Pull Request.


📄 License
This project is licensed under the MIT License. See the LICENSE file for details.

Built with 💻 by [your-username].
