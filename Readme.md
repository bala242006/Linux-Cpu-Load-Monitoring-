##### Linux Server Load Monitoring and Email Alert Automation



\## Project Overview



This project monitors Linux server CPU usage and automatically sends an email alert whenever CPU usage exceeds a defined threshold value.



The project was implemented using Bash scripting, Cron Jobs, `msmtp`, and Gmail SMTP inside WSL Ubuntu.



\---



\# Technologies Used



\* WSL Ubuntu

\* Bash Scripting

\* Cron Jobs

\* msmtp

\* Gmail SMTP Relay

\* Linux mailutils

\* stress utility



\---



\# Project Workflow



```text

Cron

&#x20;↓

monitor.sh

&#x20;↓

CPU Usage Monitoring

&#x20;↓

Threshold Comparison

&#x20;↓

msmtp

&#x20;↓

Gmail SMTP Relay

&#x20;↓

Email Alert

```



\---



\# Installing Required Packages



The following packages were installed:



```bash

sudo apt install msmtp mailutils stress

```



\### Package Purpose



| Package   | Purpose                                   |

| --------- | ----------------------------------------- |

| msmtp     | SMTP client used to send emails           |

| mailutils | Linux mail utilities                      |

| stress    | Generates artificial CPU load for testing |



\---



\# SMTP Configuration



The SMTP client was configured using the `.msmtprc` file.



\## Creating Configuration File



```bash

nano \~/.msmtprc

```



\## Example SMTP Configuration



```text

defaults

auth on

tls on

tls\_trust\_file /etc/ssl/certs/ca-certificates.crt



account gmail

host smtp.gmail.com

port 587



from yourgmail@gmail.com

user yourgmail@gmail.com

password \*\*\*\*\*\*\*\*



account default : gmail

```



\---



\# Securing SMTP Configuration



The following command was used to secure the SMTP configuration file:



```bash

chmod 600 \~/.msmtprc

```



This prevents unauthorized access to stored credentials.



\---



\# SMTP Testing



The SMTP setup was tested using:



```bash

echo "SMTP TEST" | msmtp -d recipient@gmail.com

```



Debug mode was used to verify:



\* TLS connection

\* SMTP authentication

\* successful email delivery



\---



\# CPU Monitoring Script



The monitoring script (`monitor.sh`) checks current CPU usage and sends an alert email when the threshold value is exceeded.



\---



\# Script Logic



```text

1\. Read current CPU usage

2\. Compare CPU usage with threshold value

3\. Send email alert if threshold is exceeded

```



\---



\# Running CPU Stress Test



The following command was used to generate high CPU load:



```bash

stress --cpu 8 --timeout 180

```



This simulates high server load conditions for testing.



\---



\# Cron Job Automation



Cron was used to automate monitoring execution.



\## Opening Cron Editor



```bash

crontab -e

```



\## Cron Configuration



```bash

\* \* \* \* \* /home/user\_bala/monitor.sh

```



This runs the monitoring script automatically every minute.



\---



\# Checking Cron Jobs



```bash

crontab -l

```



\---



\# Email Alert System



When CPU usage exceeds the threshold:



\* Cron automatically executes the script

\* The script checks CPU load

\* `msmtp` connects to Gmail SMTP

\* An email alert is delivered successfully



\---



\# Challenges Faced



During the project, the following issues were encountered:



\* SMTP authentication errors

\* Outlook SMTP restrictions

\* Cron debugging

\* CPU threshold testing

\* Understanding Linux command parsing

\* Understanding `awk` field extraction



These issues were solved through debugging and testing.



\---



\# Conclusion



This project successfully implemented:



\* Linux CPU monitoring

\* Automated Cron scheduling

\* SMTP-based email alert automation

\* Server load testing



The system was able to automatically detect high CPU usage and deliver email alerts successfully.



