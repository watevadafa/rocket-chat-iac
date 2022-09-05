module "backend" {
  source  = "./modules/backend"
  region  = var.aws_region
  project = "${var.environment}-${var.project_name}"
}

module "rocketchat" {
  source = "./modules/rocketchat"
  region  = var.aws_region
  project = "${var.environment}-${var.project_name}"
}