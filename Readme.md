 Linux Server Load Monitoring & Email Alert Automation

## Overview

This project implements an automated Linux server monitoring solution that continuously checks CPU utilization and sends email alerts whenever CPU usage exceeds a predefined threshold.

The system was developed and tested on **WSL Ubuntu** using **Bash scripting**, **Cron Jobs**, **msmtp**, and **Gmail SMTP**. It provides a lightweight and practical approach to server monitoring and alerting without requiring complex monitoring platforms.

---

## Features

* Real-time CPU usage monitoring
* Configurable CPU threshold limits
* Automatic email notifications
* Scheduled execution using Cron Jobs
* SMTP integration using Gmail
* CPU load simulation for testing
* Lightweight and easy to deploy

---

## Technologies Used

* WSL Ubuntu
* Bash Scripting
* Cron Jobs
* msmtp
* Gmail SMTP
* mailutils
* stress

---

## Project Workflow

```text
Cron Job
    │
    ▼
monitor.sh
    │
    ▼
CPU Usage Monitoring
    │
    ▼
Threshold Comparison
    │
    ▼
msmtp
    │
    ▼
Gmail SMTP Server
    │
    ▼
Email Alert Notification
```

---

## Installation

### Install Required Packages

```bash
sudo apt update
sudo apt install msmtp mailutils stress
```

### Package Purpose

| Package   | Purpose                                   |
| --------- | ----------------------------------------- |
| msmtp     | SMTP client for sending emails            |
| mailutils | Linux mail utilities                      |
| stress    | Generates artificial CPU load for testing |

---

## SMTP Configuration

### Create SMTP Configuration File

```bash
nano ~/.msmtprc
```

### Example Configuration

```ini
defaults

auth on
tls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account gmail
host smtp.gmail.com
port 587

from yourgmail@gmail.com
user yourgmail@gmail.com
password YOUR_APP_PASSWORD

account default : gmail
```

### Secure Configuration File

```bash
chmod 600 ~/.msmtprc
```

This prevents unauthorized access to stored SMTP credentials.

---

## Testing SMTP Connection

Verify the SMTP configuration before automation:

```bash
echo "SMTP TEST" | msmtp -d recipient@gmail.com
```

Debug mode helps verify:

* TLS connection establishment
* SMTP authentication
* Email delivery status
* Connection troubleshooting

---

## CPU Monitoring Script

Create the monitoring script:

```bash
nano monitor.sh
```

Make it executable:

```bash
chmod +x monitor.sh
```

### Script Logic

1. Read current CPU usage.
2. Compare CPU usage against the defined threshold.
3. Send an email alert if the threshold is exceeded.

---

## Running the Script Manually

```bash
./monitor.sh
```

This is useful for validating functionality before scheduling automation.

---

## CPU Stress Testing

Generate artificial CPU load to test alert functionality:

```bash
stress --cpu 8 --timeout 180
```

### Parameters

* `--cpu 8` → Creates 8 CPU workers
* `--timeout 180` → Runs for 180 seconds

This simulates high server load conditions and triggers monitoring alerts.

---

## Cron Job Automation

### Open Cron Editor

```bash
crontab -e
```

### Add Scheduled Task

```cron
* * * * * /home/user_bala/monitor.sh
```

This executes the monitoring script every minute.

### Verify Cron Jobs

```bash
crontab -l
```

---

## Monitoring & Logs

### View SMTP Logs

```bash
cat ~/.msmtp.log
```

### Check Current CPU Usage

```bash
top
```

---

## Alert Workflow

When CPU utilization exceeds the configured threshold:

1. Cron executes `monitor.sh`
2. CPU usage is collected
3. Threshold comparison is performed
4. msmtp connects to Gmail SMTP
5. Email notification is generated
6. Alert is delivered to the recipient

---

## Challenges Faced

During development, several issues were encountered and resolved:

* SMTP authentication failures
* Outlook SMTP restrictions
* Cron job debugging
* CPU threshold tuning and testing
* Linux command parsing
* Understanding `awk` field extraction
* SMTP log analysis and troubleshooting

These challenges provided practical experience in Linux administration, automation, and debugging.

---

## Project Commands Reference

### Install Packages

```bash
sudo apt install msmtp mailutils stress
```

### Create SMTP Configuration

```bash
nano ~/.msmtprc
```

### Secure SMTP Configuration

```bash
chmod 600 ~/.msmtprc
```

### Test SMTP

```bash
echo "SMTP TEST" | msmtp -d recipient@gmail.com
```

### Create Monitoring Script

```bash
nano monitor.sh
```

### Make Script Executable

```bash
chmod +x monitor.sh
```

### Run Script

```bash
./monitor.sh
```

### Generate CPU Load

```bash
stress --cpu 8 --timeout 180
```

### Edit Cron Jobs

```bash
crontab -e
```

### View Cron Jobs

```bash
crontab -l
```

### View SMTP Logs

```bash
cat ~/.msmtp.log
```

### Monitor CPU Usage

```bash
top
```

---

## Learning Outcomes

Through this project, I gained hands-on experience with:

* Linux system administration
* Bash scripting
* Cron-based task automation
* SMTP configuration and email delivery
* Server monitoring concepts
* Log analysis and troubleshooting
* Performance testing using stress tools

---

## Conclusion

This project successfully demonstrates a lightweight Linux monitoring solution capable of:

* Monitoring server CPU utilization
* Detecting threshold breaches
* Automating execution through Cron Jobs
* Sending SMTP-based email alerts
* Testing system behavior under high CPU load

The implementation provides a practical foundation for more advanced monitoring and alerting systems used in production environments.
