# SSH Remote Server Setup

This project demonstrates the manual configuration of a remote RHEL server on AWS EC2 to allow secure SSH access using multiple cryptographic key pairs.

## Project Overview
The objective is to provision a cloud-based Linux environment and configure it to accept connections from multiple distinct SSH keys, ensuring proper file permissions and security protocols are met.

## Tech Stack
- **Cloud Provider:** AWS (EC2)
- **Instance Type:** `t3.micro`
- **Operating System:** Red Hat Enterprise Linux (RHEL) 10

---

## Implementation Steps

### 1. Generate SSH Key Pairs
Two separate Ed25519 key pairs were generated on the host machine to provide distinct access credentials:
```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_rsa_project1
ssh-keygen -t ed25519 -f ~/.ssh/id_rsa_project2
```

### 2. Prepare the Remote Server
After launching the RHEL instance, the following configurations were applied to the ec2-user account:

Security Permissions (Host Machine):
To prevent the "Permissions are too open" error, private keys on the local machine were secured:

```bash
chmod 600 ~/.ssh/id_rsa_project1
chmod 600 ~/.ssh/id_rsa_project2
```

### 3. Authorized Keys (Remote Server):
The content of both public keys (.pub files) was appended to the server's authorized list.

Note: Replace <PUBLIC_KEY_CONTENT> with the actual string from your .pub files.

```bash

# Append the public key strings
echo "<PUBLIC_KEY_CONTENT_1>" >> ~/.ssh/authorized_keys
echo "<PUBLIC_KEY_CONTENT_2>" >> ~/.ssh/authorized_keys
```

### 4. Verification 

#### Using Key 1:
```bash 
ssh -i ~/.ssh/id_rsa_project1 ec2-user@<SERVER_IP>
```

#### Using Key 2:
```bash
ssh -i ~/.ssh/id_rsa_project2 ec2-user@<SERVER_IP>
```

This project is part of [roadmap.sh](https://roadmap.sh/projects/ssh-remote-server-setup)
