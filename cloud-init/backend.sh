#!/bin/bash
sed -i s/^SELINUX=.*$/SELINUX=disabled/ /etc/selinux/config
setenforce 0
hostnamectl set-hostname node-1
dnf -y install epel-release python3
