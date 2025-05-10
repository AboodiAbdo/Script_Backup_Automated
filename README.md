Script_Backup_Automated
This repository contains a Bash script designed to automate file backups from a source directory to a local backup directory. The script uses rsync for efficient and reliable file synchronization, logs the backup status, and timestamps each operation for tracking.
Table of Contents

Overview
Features
Prerequisites
Installation
Usage
Script Details
Log File
Contributing
License

Overview
The Script_Backup_Automated is a simple yet effective Bash script that performs automated backups of files from a specified source directory (/home/kali/Desktop/New_Backup) to a local backup directory (/home/kali/Desktop/Backup). It logs the success or failure of each backup operation in a log file (backup.log) with timestamps.
Features

Automated Backups: Uses rsync to synchronize files between source and backup directories.
Logging: Records backup success or failure with timestamps in a log file.
Error Handling: Checks the exit status of rsync to determine if the backup was successful.
Customizable Paths: Easily modify source and backup directory paths in the script.

Prerequisites

Operating System: Linux (tested on Kali Linux).
Tools Required:
rsync: Must be installed for file synchronization.
bash: The script runs in a Bash environment.


Permissions: Ensure the user has read/write permissions for the source and backup directories.

To install rsync on a Debian-based system (like Kali Linux):
sudo apt update
sudo apt install rsync

Installation

Clone the repository:git clone https://github.com/your-username/Script_Backup_Automated.git
cd Script_Backup_Automated


Ensure the script (backup.sh) has executable permissions:chmod +x backup.sh


Update the script variables (if needed) to match your source and backup directories.

Usage

Run the script manually:./backup.sh


Schedule automatic backups using cron (optional):
Open the crontab editor:crontab -e


Add a line to run the script daily at midnight (example):0 0 * * * /path/to/Script_Backup_Automated/backup.sh





Script Details
Below is the full Bash script (backup.sh) included in this repository:
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

Explanation

Variables:
source: The directory to back up (/home/kali/Desktop/New_Backup).
log_situation: The log file name (backup.log) where backup status is recorded.
local_backup_dir: The destination directory for backups (/home/kali/Desktop/Backup).


Function:
perform_backup: Executes the rsync command with -avz flags (archive mode, verbose, compress).
Checks the exit status ($?) to log whether the backup succeeded or failed.


Execution:
The perform_backup function is called to initiate the backup process.



Notes

The rsync command in the script syncs files from local_backup_dir to source. If you intended to back up from source to local_backup_dir, swap the paths in the rsync command:rsync -avz "$source" "$local_backup_dir" > "$log_situation" 2>/dev/null


The log file (backup.log) is created in the same directory as the script.

Log File
The script generates a backup.log file with entries like:
backup successful :Sat May 10 12:34:56 UTC 2025
backup failed :Sat May 10 12:35:10 UTC 2025

Check this file to monitor backup operations.
Contributing
Contributions are welcome! To contribute:

Fork the repository.
Create a new branch (git checkout -b feature-branch).
Make your changes and commit (git commit -m "Add feature").
Push to the branch (git push origin feature-branch).
Open a Pull Request.

License
This project is licensed under the MIT License. See the LICENSE file for details.
