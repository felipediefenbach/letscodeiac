#!/bin/bash
sed -i s/^SELINUX=.*$/SELINUX=disabled/ /etc/selinux/config
setenforce 0
hostnamectl set-hostname master-node
dnf -y install epel-release python3
