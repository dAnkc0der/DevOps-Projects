# Dummy SystemD Service

This project demonstrates how to create, configure, and manage a background service on a Linux system (RHEL) using **systemd**.

## Requirements

- Create a script by the name of dummy.sh similar to one in this project and make it executable under/usr/local/bin
- Create a systemd file by the name of dummy.service under similar to one in this project under /etc/systemd/system
- Now perform this ```sudo systemctl daemon-reload```
- Now perform below
  ```
  sudo systemctl start dummy
  sudo systemctl stop dummy 
  sudo systemctl enable dummy
  sudo systemctl disable dummy
  sudo systemctl status dummy
  ```

 - Check logs :- ```sudo tail -f /var/log/dummy.log```

This project is part of [roadmap.sh](https://roadmap.sh/projects/dummy-systemd-service) 
