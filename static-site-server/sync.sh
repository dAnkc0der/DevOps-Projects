#!/bin/bash

IP=$1
KEY="Path to Key Pair stored for AWS."
WEBPATH="Path where static site server assets are kept."

rsync -avz -e "ssh -i $KEY" --rsync-path="sudo rsync" "$WEBPATH" ec2-user@"$IP":/usr/share/nginx/html/

ssh -i "$KEY" ec2-user@"$IP" "sudo systemctl restart nginx"
