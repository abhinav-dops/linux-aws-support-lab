## Operational Commands Used

Commands run during this project on a live Ubuntu EC2 instance:

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
