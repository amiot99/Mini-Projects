## Step 1 - User & Permissions Management

### Creating a New User
**Goal:** Create a new user with a home directory.  
**Command:**
```bash
sudo useradd -m jimmy
```
**Verification:**
```bash
tail -n 1 /etc/passwd
```

---

### Creating a Shared Group for Collaboration
**Goal:** Create a group that allows multiple users to share permissions using a common group.  
**Command:**
```bash
sudo groupadd developers
```
**Verification:**
```bash
getent group developers
```

---

### Adding a User to a Group
**Goal:** Add the new user to the `developers` group for shared access.  
**Command:**
```bash
sudo usermod -aG developers jimmy
```
**Verification:**
```bash
groups jimmy
```

---

### Setting a Password for a User
**Goal:** Assign a password to the new user so they can log in or switch users.  
**Command:**
```bash
sudo passwd jimmy
```

---

### Controlling Access to Files and Directories
**Goal:** Manage who can read, write, or execute files and directories by adjusting ownership and permissions.  
**Command:**
```bash
# Change the group ownership of /home/aamiot and /home/aamiot/testdir
sudo chown :developers /home/aamiot
sudo chown :developers /home/aamiot/testdir

# Change the group ownership of private.txt to developers
sudo chown :developers /home/aamiot/testdir/private.txt

# Set directory permissions:
# - Allow group members to read and execute in /home/aamiot
# - Allow group members full access in /home/aamiot/testdir
sudo chmod 750 /home/aamiot
sudo chmod 770 /home/aamiot/testdir
```
**Verification:**
```bash
# Check group ownership and permissions for directories and file
ls -ld /home/aamiot /home/aamiot/testdir
ls -l /home/aamiot/testdir/private.txt

# Confirm 'jimmy' is part of the 'developers' group
groups jimmy
```
**Expected Output Example:**
```
drwxr-x--- 13 aamiot developers 4096 Oct 19 19:56 /home/aamiot
drwxrwx---  2 aamiot developers 4096 Oct 19 19:57 /home/aamiot/testdir
-rw-rw----  1 aamiot developers   49 Oct 19 21:23 /home/aamiot/testdir/private.txt
jimmy : jimmy developers
```
**Explanation:**  
- `chown :developers` - assigns group ownership to the `developers` group.  
- `chmod 750` - Owner: read/write/execute, Group: read/execute, Others: no access.  
- `chmod 770` - Owner & Group: full access, Others: no access.  
- This ensures only `aamiot` and users in `developers` (like `jimmy`) can collaborate safely in `/home/aamiot/testdir` and work with `private.txt`.

---

### Switching Between Users
**Goal:** Test user permissions and perform tasks as another user.  
**Command:**
```bash
# Switch to the 'jimmy' user with a full login shell
su - jimmy

# Confirm current user
whoami

# Attempt to access the shared directory
cd /home/aamiot/testdir
ls
cat private.txt
```
**Explanation:**  
- `su - jimmy` logs into `jimmy`’s environment as if they signed in directly.  
- `whoami` confirms the active user.  
- Access to `/home/aamiot/testdir/private.txt` verifies that permissions and group membership were set correctly.

---
