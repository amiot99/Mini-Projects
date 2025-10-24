#  Project: System Admin for a Day

Learn the core building blocks of Linux system administration - from users and permissions to automation and monitoring.

## Project Parts
- [Part 1 - User & Permissions Management](part1_users_permissions.md)
- [Part 2 - Service Management (Nginx)](part2_service_management.md)
- [Part 3 - Automation with Cron](part3_automation_cron.md)

---

## Monitoring Lab: Automated System Reports

In this section, I applied what I learned by building a **Bash-based system monitoring tool** that runs automatically via `cron`.

**Key Features**
- Generates system snapshots (uptime, memory, disk, network ports)
- Automatically timestamps each snapshot
- Stores snapshots in `/monitoring_lab/observations`
- Scheduled to run every 5 minutes using `cron`

**Files**
| File | Description |
|------|--------------|
| [monitoring_lab/system_report.sh](monitoring_lab/system_report.sh) | Bash script that collects system metrics and outputs timestamped reports |
| [monitoring_lab/basic_report.txt](monitoring_lab/basic_report.txt) | Example snapshot output generated during early testing |
| .gitignore | Prevents hundreds of snapshot logs from being committed |

**Automation Example**
```bash
# Cron entry (runs every 5 minutes)
*/5 * * * * /bin/bash -lc "/home/aamiot/projects/project-1-system-admin/monitoring_lab/system_report.sh" >/dev/null 2>&1
