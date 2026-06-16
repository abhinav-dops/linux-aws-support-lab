# CloudWatch Monitoring Setup

## Alarms Created
- lab-cpu-high: triggers when CPU > 70% for 1 datapoint within 1 minute
- lab-status-check: triggers when EC2 status check fails

## Metrics Monitored
- CPUUtilization (EC2 built-in)
- StatusCheckFailed (EC2 built-in)
- mem_used_percent (CloudWatch agent)
- disk_used_percent (CloudWatch agent)

## Log Groups
- /var/log/sysmon.log → sysmon log group
- /var/log/nginx/error.log → nginx-error log group

## SNS Topic
- lab-alerts: email notification on alarm trigger
