#!/bin/bash

component=$1
environment=$2

dnf install ansible -y

cd /home/ec2-user

# Use the correct repository (with underscore)
git clone https://github.com/Sutluru-Reddy-Chanakya/Ansible_Roboshop_roles.git
cd Ansible_Roboshop_roles
git pull

ansible-playbook -e component=$component -e env=$environment roboshop.yml