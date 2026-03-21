#!/bin/bash

src_dir=$1
backup_dir=~/project/log-backups
archive_name="logs_$(date +%F).tar.gz"

mkdir -p "${backup_dir}"

sudo tar --gzip -cvzf "$backup_dir/$archive_name" "$src_dir"