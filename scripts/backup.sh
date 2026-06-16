#!/bin/bash

DATE=$(date '+%Y-%m-%d')
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
HOST=$(hostname)

BACKUP_DIR="/backup"
SOURCE="/var/www/labsite"
LOG="/var/log/sysmon.log"

touch $LOG 2>/dev/null || exit 1

if [ ! -d "$SOURCE" ]; then
    echo "[$TIMESTAMP] [$HOST] ERROR: Source directory not found." >> $LOG
    exit 1
fi

mkdir -p $BACKUP_DIR

if tar -czf $BACKUP_DIR/labsite-$DATE.tar.gz $SOURCE; then
    echo "[$TIMESTAMP] [$HOST] BACKUP: $SOURCE backed up successfully." >> $LOG
else
    echo "[$TIMESTAMP] [$HOST] ERROR: Backup failed." >> $LOG
    exit 1
fi

exit 0
