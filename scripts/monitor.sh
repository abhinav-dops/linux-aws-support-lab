#!/bin/bash

LOG="/var/log/sysmon.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
HOST=$(hostname)

touch $LOG 2>/dev/null || exit 1

CPU=$(vmstat 1 2 | tail -1 | awk '{print 100-$15}')
DISK=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)
MEM=$(free | awk '/Mem/{printf("%.0f"), $3/$2*100}')

echo "[$DATE] [$HOST] CPU:$CPU% Disk:$DISK% Mem:$MEM%" >> $LOG

check_threshold() {
    VALUE=$1
    LIMIT=$2
    NAME=$3

    if [ "$VALUE" -gt "$LIMIT" ]; then
        echo "[$DATE] ALERT: $NAME usage high: $VALUE%" >> $LOG
    fi
}

check_threshold "$CPU" 80 "CPU"
check_threshold "$DISK" 85 "Disk"
check_threshold "$MEM" 85 "Memory"

echo "[$DATE] Monitoring completed" >> $LOG

exit 0
