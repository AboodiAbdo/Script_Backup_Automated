#!/bin/bash

# Variables
source="/home/kali/Desktop/New_Backup"  #Directory wanato Backup 
log_situation="backup.log"
local_backup_dir="/home/kali/Desktop/Backup" #Directory wanato  Send Backup 

# Function
perform_backup(){
  rsync -avz /home/kali/Desktop/Backup /home/kali/Desktop/New_Backup > "$log_situation" 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "backup successful :$(date)" >> "$log_situation"
    notify-send "Backup Status" "Backup completed successfully" -t 5000
  else
    echo "backup failed :$(date)" >> "$log_situation"
    notify-send "Backup Status" "Backup failed" -t 5000 -u critical
  fi
}

# Run the backup
perform_backup