# Part 3 - Automation with Cron

## Goal
Learn how to automate recurring system tasks using the `cron` service to schedule commands at fixed intervals.

---

## Commands I Ran

```bash
# Verify that the cron service is active
sudo systemctl status cron

# View any existing cron jobs for the current user
crontab -l

# Edit the user’s crontab to add new jobs
crontab -e

# Log system uptime every minute
* * * * * /usr/bin/uptime >> /tmp/uptime.log

# Log disk usage every 5 minutes
*/5 * * * * /usr/bin/df -h >> /tmp/disk_usage.log

# Verify that both logs are being created and updated
ls -l /tmp/uptime.log /tmp/disk_usage.log
tail -n 5 /tmp/uptime.log
tail -n 5 /tmp/disk_usage.log

# Check cron activity in system logs
grep CRON /var/log/syslog | tail -n 5