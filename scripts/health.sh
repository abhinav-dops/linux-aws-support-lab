#!/bin/bash

LOG="/var/log/sysmon.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
HOST=$(hostname)
SERVICE="nginx"

touch $LOG 2>/dev/null || exit 1

if ! systemctl is-active --quiet $SERVICE; then
    echo "[$DATE] [$HOST] WARNING: $SERVICE is down. Attempting restart..." >> $LOG

    systemctl restart $SERVICE

    if systemctl is-active --quiet $SERVICE; then
        echo "[$DATE] [$HOST] RECOVERY: $SERVICE restarted successfully." >> $LOG
    else
        echo "[$DATE] [$HOST] CRITICAL: $SERVICE failed to restart." >> $LOG
        journalctl -u $SERVICE -n 5 >> $LOG
    fi

else
    echo "[$DATE] [$HOST] OK: $SERVICE is running." >> $LOG
fi

exit 0
