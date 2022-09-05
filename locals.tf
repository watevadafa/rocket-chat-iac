locals {
  aws_availability_zones = var.aws_availability_zones
}

locals {
  aws_default_tags = {
    Environment = var.environment,
    Project     = var.project_name,
    managedBy   = "Terraform",
  }
}

