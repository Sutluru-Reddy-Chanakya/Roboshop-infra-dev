data "aws_ssm_parameter" "frontend_alb_sg_id" {
    name = "/${var.project}/${var.env}/frontend_alb_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
    name = "/${var.project}/${var.env}/public_subnet_ids"
}

data "aws_ssm_parameter" "frontend_alb_certificate_arn" {
    name = "/${var.project}/${var.env}/frontend_alb_certificate_arn"
}