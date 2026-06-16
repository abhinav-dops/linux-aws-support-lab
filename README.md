# Linux & AWS Infrastructure Support Lab

A hands-on infrastructure support project simulating real-world Linux server 
administration, monitoring, and incident response on AWS EC2.

## Project Goal
Demonstrate skills required for Technical Support Engineer, Cloud Support Engineer,
and L1 AWS Support roles.

## Stack
- Ubuntu 22.04 (EC2 t2.micro)
- Nginx (web server + reverse proxy)
- Bash scripting
- Cron automation
- UFW firewall
- AWS CloudWatch + SNS
- systemd + journalctl

## What Was Built

### Phase 1 — Server Setup & SSH Hardening
- Launched EC2, attached Elastic IP
- Created users, groups, sudo permissions
- Set file permissions with chmod/chown
- Hardened SSH: disabled root login, changed port to 2222,
  enforced key-only auth, set MaxAuthTries 3

### Phase 2 — Nginx + Firewall
- Hosted static site on port 80
- Configured reverse proxy (port 80 → 3000)
- UFW rules: allow 2222, 80, 443 — deny all else

### Phase 3 — Monitoring & Automation
- monitor.sh: checks CPU, disk, memory every 5 minutes — alerts on threshold breach
- health.sh: checks nginx every 5 minutes — auto-restarts if down
- backup.sh: daily backup of /var/www/labsite to /backup/
- Cron: separate log per script (cron-monitor.log, cron-health.log, cron-backup.log)
- Simulated CPU spike with stress tool — ALERT captured in sysmon.log

### Phase 4 — CloudWatch
- Installed and configured CloudWatch agent
- Metrics: CPU, memory, disk
- Log groups: sysmon, nginx-error
- Alarms: lab-cpu-high (>70%), lab-status-check
- SNS email alert verified during CPU spike test

## Incidents Simulated
| # | Incident | Detection | Resolution |
|---|----------|-----------|------------|
| 001 | CPU spike (100%) | monitor.sh alert | Stress workload ended |
| 002 | Nginx down | health.sh WARNING | Auto-restarted via systemctl |
| 003 | Disk full (procedure) | monitor.sh threshold | Log rotation + cleanup cron |

## Operational Commands Used

### Service Management
systemctl status nginx  
systemctl restart nginx  
systemctl enable nginx  
journalctl -u nginx -n 20  
journalctl -xe  
journalctl --since "1 hour ago"  

### Log Analysis
tail -f /var/log/sysmon.log  
grep "ERROR" /var/log/sysmon.log  
grep "failed" /var/log/auth.log  
grep "error" /var/log/nginx/error.log  

### File & Permissions
vim /etc/nginx/nginx.conf  
vim /etc/ssh/sshd_config  
chmod +x *.sh  
chown -R www-data:www-data /var/www/labsite  

### Monitoring
df -h  
free -m  
top  
htop  
vmstat 1 2  

### Cron & Automation
crontab -e  
crontab -l  

## Repository Structure
scripts/     — monitor.sh, health.sh, backup.sh  
configs/     — nginx.conf, sshd_config.diff, ufw-rules.txt  
cron/        — crontab.txt  
docs/        — incident tickets, RCA, CloudWatch setup
