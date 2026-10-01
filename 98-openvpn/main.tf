resource "aws_instance" "openvpn" {
  ami           = "ami-0f79ef8ffa0f2dd69"
  instance_type = "t3.small"
  subnet_id = local.public_subnet_id
  vpc_security_group_ids = [local.openvpn_sg_id]
  user_data = file("vpn.sh")

  tags = merge(
    {
        Name = "${var.project}-${var.environment}-openvpn"
    },
    local.common_tags
  )
}