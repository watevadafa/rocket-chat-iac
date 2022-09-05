# ------------------------------------------------------------------------------
# S3 BUCKET - LOGGING BUCKET
# ------------------------------------------------------------------------------
resource "aws_s3_bucket" "tfstate_logs_bucket" {
  bucket = "${var.project}-tfstate-logs"

  tags = {
    purpose = "Logging bucket for Terraform State Storage Bucket"
  }
}

# Enables versioning to view full revision history of state log files
resource "aws_s3_bucket_versioning" "tfstate_logs_versioning" {
  bucket = aws_s3_bucket.tfstate_logs_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "tfstate_logs_acl" {
  bucket = aws_s3_bucket.tfstate_logs_bucket.id
  acl    = "log-delivery-write"
}

# ------------------------------------------------------------------------------
# DYNAMODB TABLE - STATE LOCKING AND CONSISTENCY
# ------------------------------------------------------------------------------
resource "aws_dynamodb_table" "tfstate_locks" {
  name         = "${var.project}-tfstate-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    purpose = "Provide Terraform backend state locking and consistency checking."
  }
}

# ------------------------------------------------------------------------------
# S3 BUCKET - TO STORE TERRAFORM STATE
# ------------------------------------------------------------------------------
resource "aws_s3_bucket" "tfstate_bucket" {
  bucket = "${var.project}-tfstate"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    "purpose" = "To store the terraform state as a given key"
  }

}

# Enable versioning to view full revision history of state files
resource "aws_s3_bucket_versioning" "tfstate_bucket_versioning" {
  bucket = aws_s3_bucket.tfstate_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "tfstate_bucket_acl" {
  bucket = aws_s3_bucket.tfstate_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_logging" "tfstate_bucket_logging" {
  bucket = aws_s3_bucket.tfstate_bucket.id
  target_bucket = aws_s3_bucket.tfstate_logs_bucket.id
  target_prefix = "log/"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate_bucket_encryption" {
  bucket = aws_s3_bucket.tfstate_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# ------------------------------------------------------------------------------
# WRITES TERRAFORM STATE SETTINGS TO LOCAL FILE 
# ------------------------------------------------------------------------------
resource "local_file" "key" {
  filename = "backend.tf"
  content  = <<EOF
terraform {
  backend "s3" {
    bucket         = "${aws_s3_bucket.tfstate_bucket.id}"
    key            = "terraform.tfstate"
    region         = "${var.region}"
    encrypt        = true
    dynamodb_table = "${aws_dynamodb_table.tfstate_locks.id}"
  }
}
  EOF
}