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