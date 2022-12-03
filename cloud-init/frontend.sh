#!/bin/bash
dnf -y install epel-release
dnf -y install ansible git
git clone https://github.com/felipediefenbach/letscodeiac.git /root/letscodeiac
cd /root/letscodeiac || exit
ansible -i localhost backend.yml