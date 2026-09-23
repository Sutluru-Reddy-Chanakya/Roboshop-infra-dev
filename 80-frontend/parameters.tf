resource "aws_ssm_parameter" "frontend_alb_listener_arn" {
  name  = "/${var.project}/${var.env}/frontend_alb_listener_arn"
  type  = "String"
  value = aws_lb_listener.https.arn
}