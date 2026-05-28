#!/bin/bash

THRESHOLD=80

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

CPU_INT=${CPU_USAGE%.*}

echo "Current CPU Usage: $CPU_USAGE%"

if [ "$CPU_INT" -ge "$THRESHOLD" ]; then

echo -e "Subject: Linux Server CPU Alert\n\nWarning!\n\nThe CPU usage on the Linux server has exceeded the threshold limit.\n\nCurrent CPU Usage: $CPU_USAGE%\n\nAction Recommended:\nCheck running processes and system load immediately.\n\nGenerated Automatically by Cron Monitoring System." | msmtp Bala.Soorya@akumenbyq.com

fi
