locals {
    common_tags = {
        Project = var.project
        Environment = var.env
        Terraform = "true"
    }
  ami_id = data.aws_ami.joindevops.id
  db_subnet_ids = split(",", data.aws_ssm_parameter.db_subnet_ids.value)[0]
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
  resdis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
}