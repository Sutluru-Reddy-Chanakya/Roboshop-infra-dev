resource "aws_security_group_rule" "bastion_accepting_from_internet" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = [local.my_ip]

  security_group_id = local.bastion_sg_id
}

resource "aws_security_group_rule" "mongodb_accepting_from_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id

  security_group_id = local.mongodb_sg_id
}


resource "aws_security_group_rule" "mongodb_accepting_from_catalogue"{
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id = local.catalogue_sg_id
  security_group_id = local.mongodb_sg_id
}



resource "aws_security_group_rule" "mongodb_accepting_from_user"{
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id = local.user_sg_id
  security_group_id = local.mongodb_sg_id
}



resource "aws_security_group_rule" "redis_accepting_from_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id

  security_group_id = local.redis_sg_id
}


resource "aws_security_group_rule" "mysql_accepting_from_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id

  security_group_id = local.mysql_sg_id
}

resource "aws_security_group_rule" "rabbitmq_accepting_from_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id

  security_group_id = local.rabbitmq_sg_id
}


resource "aws_security_group_rule" "backend_alb_accepting_from_bastion" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id

  security_group_id = local.backend_alb_sg_id
}




resource "aws_security_group_rule" "catalogue_accepting_from_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id

  security_group_id = local.catalogue_sg_id
}


resource "aws_security_group_rule" "catalogue_accepting_from_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = local.backend_alb_sg_id

  security_group_id = local.catalogue_sg_id
}



resource "aws_security_group_rule" "frontend_alb_accepting_from_public" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443 
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "tcp"
  source_security_group_id = local.backend_alb_sg_id

  security_group_id = local.frontend_alb_sg_id
}

