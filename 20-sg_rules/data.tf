# Fetch public IP address
data "http" "my_public_ip" {
  url = "https://ipv4.icanhazip.com"
}

# Clean the trailing newline character
locals {
  my_ip = "${chomp(data.http.my_public_ip.response_body)}/32"
}

# Output the IP to your terminal
output "my_ip_address" {
  value = local.my_ip
}


data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project}/${var.env}/bastion_sg_id"
}

data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/${var.project}/${var.env}/mongodb_sg_id"
}

data "aws_ssm_parameter" "catalogue_sg_id" {
  name = "/${var.project}/${var.env}/catalogue_sg_id"
}

data "aws_ssm_parameter" "user_sg_id" {
  name = "/${var.project}/${var.env}/user_sg_id"
}

