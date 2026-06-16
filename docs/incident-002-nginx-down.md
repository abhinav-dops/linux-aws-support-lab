# Incident 002 — Nginx Service Down

**Date:** 2026-06-15  
**Severity:** High  
**Component:** Nginx web server (ip-172-31-1-143)

## Symptom
Website unreachable, HTTP connection refused on port 80.

## Detection
health.sh detected nginx not running, logged WARNING to /var/log/sysmon.log.
Automated restart attempted immediately.

## Root Cause
Nginx service stopped manually to simulate production failure.

## Resolution
health.sh auto-restarted nginx via systemctl.
Service restored within 30 seconds of detection.

## Prevention
- health.sh runs every 5 minutes via cron
- CloudWatch status check alarm monitors instance health
- UFW restricts access to ports 80 and 2222 only
