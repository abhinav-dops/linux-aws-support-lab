# RCA — Nginx Auto-Recovery

**Date:** 2026-06-15  
**Author:** Abhinav Singh  
**Status:** Resolved

## Timeline
- 17:05:47 — health.sh detected nginx down
- 17:05:47 — Auto-restart triggered via systemctl
- 17:06:24 — Nginx confirmed running, logged RECOVERY

## Root Cause
Service stopped unexpectedly (simulated production failure scenario).

## Contributing Factors
- No prior alerting mechanism in place before this lab
- Manual intervention would have been required without automation

## Resolution
Automated health check detected and resolved the issue within the cron interval.

## Action Items Completed
- health.sh deployed and running via cron every 5 minutes
- All recovery actions logged to /var/log/sysmon.log
- CloudWatch alarm added as secondary monitoring layer
