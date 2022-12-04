#!/bin/bash
hostnamectl set-hostname master-node
dnf -y install epel-release python3
setenforce 0