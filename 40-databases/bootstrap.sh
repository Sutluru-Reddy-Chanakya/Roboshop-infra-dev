#!/bin/bash

component=$1
environment=$2

dnf install ansible -y

cd /home/ec2-user

# Remove existing directory to ensure fresh clone
rm -rf Ansible-Roboshop-roles-tf

git clone https://github.com/Sutluru-Reddy-Chanakya/Ansible-Roboshop-roles-tf.git
cd Ansible-Roboshop-roles-tf
git pull

ansible-playbook -e component=$component -e env=$environment roboshop.yml