# #!/bin/bash

component=$1
environment=$2
 dnf install ansible -y

cd  /home/ec2-user
git clone https://github.com/Sutluru-Reddy-Chanakya/Ansible-Roboshop-roles-tf.git
cd Ansible-Roboshop-roles-tf
git pull

ansible-playbook -e component=$component -e env=$environment roboshop.yml




