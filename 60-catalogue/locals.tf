locals {
    ami_id = data.aws_ami.joindevops.id
  catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
  private_subnet_ids = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
  common_tags = {
        Project = var.project
        Environment = var.env
        Terraform = "true"
    }
}