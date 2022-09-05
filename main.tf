module "backend" {
  source  = "./modules/backend"
  region  = var.aws_region
  project = "${var.environment}-${var.project_name}-chat"
}

module "rocketchat" {
  source            = "./modules/rocketchat"
  region            = var.aws_region
  project_name      = var.project_name
  environment       = var.environment
  domain_name       = var.domain_name
  chat_sub_domain   = var.chat_sub_domain
  ec2_instance_type = var.ec2_instance_type
}