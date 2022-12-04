#!/bin/bash
hostnamectl set-hostname node-1
dnf -y install epel-release python3
setenforce 0