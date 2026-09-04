# resource "aws_ssm_parameter" "mongodb_sg_id" {
#   name  = "/${var.project}/${var.env}/mongodb_sg_id"
#   type  = "String"
#   value = module.sg.sg_id
#   overwrite = true  # ✅ This will overwrite the existing parameter
# }


resource "aws_ssm_parameter" "sg_ids" {
  count = length(var.sg_names)
  name  = "/${var.project}/${var.env}/${(var.sg_names[count.index])}_sg_id"
  type  = "String"
  value = module.sg[count.index].sg_id
  overwrite = true  # ✅ This will overwrite the existing parameter



}