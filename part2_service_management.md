# Part 2 - Service Management (Nginx)

## Goal
Learn how Linux manages long-running background processes (daemons) by installing, starting, enabling, and verifying a real service.

---

## Commands I Ran

```bash
# Install Nginx
sudo apt update && sudo apt install nginx -y

# Start the service
sudo systemctl start nginx

# Verify it's running
sudo systemctl status nginx

# Enable Nginx to start automatically at boot
sudo systemctl enable nginx

# Check that it's enabled
systemctl is-enabled nginx

# Confirm Nginx is listening on port 80
sudo ss -tuln | grep 80

# Test locally
curl localhost