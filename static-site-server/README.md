# Static Site Server

This project involves setting up a Linux server to host a static website using Nginx and automating the deployment process from a local machine using `rsync`.

## 🚀 Project Overview
The goal of this project is to understand web server administration by:
- Provisioning a remote RHEL server on AWS EC2.
- Installing and configuring Nginx.
- Creating a deployment script to sync local web assets to the server.

## 🛠️ Tech Stack
- **Cloud Provider:** AWS (EC2)
- **Instance Type:** `t3.micro`
- **Web Server:** Nginx
- **Operating System:** Red Hat Enterprise Linux (RHEL) 10
- **Tools:** `rsync`, `ssh`, `bash`

---

## 📖 Implementation Steps

### 1. Server Setup & Nginx Installation
After connecting to the server via SSH, Nginx was installed and started:
```bash
# Install Nginx
sudo dnf install nginx -y

# Start and enable Nginx to run on boot
sudo systemctl enable --now nginx

# Configure Firewall to allow HTTP (Port 80)
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
```

### 2.Local Web Assets
A simple static site was created in a local directory consisting of:

- index.html
- style.css

### 3. Automated Deployment Script
To streamline updates, a sync.sh script was created. This script synchronizes the local directory with the server's web root (/usr/share/nginx/html/).

### 4. How to deploy

- Ensure the script is executable:

``` bash
chmod +x sync.sh
```

- Run the deployment by providing the server IP:

``` bash
./sync.sh <Server IP>
```
