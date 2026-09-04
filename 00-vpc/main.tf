module "vpc" {
  source = "../../Terraform-aws-vpc"
  project  = var.project
  env      = var.env
  is_peering_required = true 
 
}








