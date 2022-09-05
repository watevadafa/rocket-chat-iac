# ------------------------------------------------------------------------------
# Project Variables
# ------------------------------------------------------------------------------
variable "environment" {
  type        = string
  default     = "production"
  description = "This is the Environment for which the resources are used."
}

variable "project_name" {
  type        = string
  description = "This is the Project name for which the resources are used."
}

variable "domain_name" {
  type        = string
  description = "This is the Project name for which the resources are used."
}


# ------------------------------------------------------------------------------
# AWS Provider Variables
# ------------------------------------------------------------------------------
variable "aws_region" {
  type        = string
  description = "This is the AWS Region used for creating the Resources."
}

variable "aws_profile" {
  type        = string
  default     = "default"
  description = "This is the AWS profile name as set in the AWS Shared Credentials file."
}

variable "aws_shared_credentials_file" {
  type        = string
  description = "This is the path to the AWS shared credentials file."
  default     = "~/.aws/credentials"
}

variable "additonal_aws_tags" {
  type        = map(string)
  default     = {}
  description = "Key-Value map of tags to apply across all resources handled by AWS provider."
}
