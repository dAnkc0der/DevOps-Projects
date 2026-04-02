#!/bin/bash

IP=$1
KEY="/Users/utkarsh117/Downloads/AWS-Key/Key-Pair-2.pem"
WEBPATH="/Users/utkarsh117/Downloads/web/"

rsync -avz -e "ssh -i $KEY" --rsync-path="sudo rsync" "$WEBPATH" ec2-user@"$IP":/usr/share/nginx/html/

ssh -i "$KEY" ec2-user@"$IP" "sudo systemctl restart nginx"