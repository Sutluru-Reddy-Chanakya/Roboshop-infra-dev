

resource "aws_ssm_parameter" "backend_alb_listener_arn" {
  count = length(var.sg_names)
  name  = "/${var.project}/${var.env}/${(var.sg_names[count.index])}_backend_alb_listener__arn"
  type  = "String"
  value = aws_lb_listener.http_listener.arn
  overwrite = true  # ✅ This will overwrite the existing parameter



}