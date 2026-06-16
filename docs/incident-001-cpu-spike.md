# Incident 001 — CPU Spike

**Date:** 2026-06-16  
**Severity:** Warning  
**Component:** EC2 instance (ip-172-31-1-143)

## Symptom
CPU usage hit 100%, detected by monitor.sh

## Root Cause
stress tool simulating CPU-intensive workload (2 CPU hogs, 30s)

## Detection
Automated monitoring script flagged: `ALERT: CPU usage high: 100%`

## Resolution
Workload completed naturally. CPU returned to 8% within 30 seconds.

## Prevention
monitor.sh runs every 5 minutes via cron to catch sustained spikes early.
