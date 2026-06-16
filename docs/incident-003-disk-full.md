# Incident 003 — Disk Usage Warning

**Date:** 2026-06-16  
**Severity:** Warning  
**Component:** EC2 root volume (ip-172-31-1-143)

## Symptom
monitor.sh would alert if disk usage exceeds 85%.

## Current State
Disk at 35% usage. Alert threshold set at 85%.

## Prevention Steps Implemented
- monitor.sh checks disk every 5 minutes
- Weekly cron job truncates logs older than 7 days
- Daily backup compresses /var/www/labsite to /backup/

## Resolution Procedure (if triggered)
1. Run df -h to identify full partition
2. Run du -sh /var/log/* to find large files
3. Truncate or rotate logs
4. Clear /tmp if needed
5. Verify disk drops below threshold
