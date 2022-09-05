locals {
  aws_availability_zones = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
}

locals {
  aws_default_tags = {
    Environment = var.environment,
    Project     = var.project_name,
    managedBy   = "Terraform",
  }
}

