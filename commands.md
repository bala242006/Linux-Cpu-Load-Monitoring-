## Linux Server Load Monitoring Project Commands



Installing Required Packages

sudo apt install msmtp mailutils stress



Creating SMTP Configuration File

nano \~/.msmtprc



Securing SMTP Configuration File

chmod 600 \~/.msmtprc



Testing SMTP Connection

echo "SMTP TEST" | msmtp -d recipient@gmail.com



Creating Monitoring Script

nano monitor.sh



Making Script Executable

chmod +x monitor.sh



Running CPU Stress Test

stress --cpu 8 --timeout 180



Running Monitoring Script Manually

./monitor.sh



Opening Cron Editor

crontab -e



Cron Job Configuration

\* \* \* \* \* /home/user\_bala/monitor.sh



Listing Cron Jobs

crontab -l



Viewing SMTP Logs

cat \~/.msmtp.log



Checking Current CPU Usage

top





