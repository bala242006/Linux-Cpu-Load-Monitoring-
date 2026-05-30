##### Linux Server Load Monitoring Project Commands



\## Installing Required Packages



```bash

sudo apt install msmtp mailutils stress

```



\## Creating SMTP Configuration File



```bash

nano \~/.msmtprc

```



\## Securing SMTP Configuration File



```bash

chmod 600 \~/.msmtprc

```



\## Testing SMTP Connection



```bash

echo "SMTP TEST" | msmtp -d recipient@gmail.com

```



\## Creating Monitoring Script



```bash

nano monitor.sh

```



\## Making Script Executable



```bash

chmod +x monitor.sh

```



\## Running CPU Stress Test



```bash

stress --cpu 8 --timeout 180

```



\## Running Monitoring Script Manually



```bash

./monitor.sh

```



\## Opening Cron Editor



```bash

crontab -e

```



\## Cron Job Configuration



```bash

\* \* \* \* \* /home/user\_bala/monitor.sh

```



\## Listing Cron Jobs



```bash

crontab -l

```



\## Viewing SMTP Logs



```bash

cat \~/.msmtp.log

```



\## Checking Current CPU Usage



```bash

top

```

