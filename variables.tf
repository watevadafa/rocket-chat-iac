# ------------------------------------------------------------------------------
# Project Config Variables
# ------------------------------------------------------------------------------
variable "environment" {
  type        = string
  default     = "production"
  description = "This is the Environment name for the resources."
}

variable "project_name" {
  type        = string
  description = "This is the Project name for which the resources are used."
}

# ------------------------------------------------------------------------------
# AWS Provider Variables
# ------------------------------------------------------------------------------
variable "domain_name" {
  type        = string
  description = "This is the Project's primary domain name used in AWS Route53."
}

variable "aws_region" {
  type        = string
  description = "This is the AWS Region used for creating the Resources."
}

variable "aws_access_key" {
  type        = string
  description = "This is the access key for AWS IAM in use."
}

variable "aws_secret_key" {
  type        = string
  description = "This is the secret key for AWS IAM in use."
}

variable "additonal_aws_tags" {
  type        = map(string)
  default     = {}
  description = "Key-Value map of tags to apply across all resources handled by AWS provider."
}

# ------------------------------------------------------------------------------
# RocketChat Variables
# ------------------------------------------------------------------------------
variable "ec2_instance_type" {
  type        = string
  description = "This is AWS Ec2 instance type to be used for chat server."
  default     = "t2.micro"
}

variable "chat_sub_domain" {
  type        = string
  description = "This is sub-domain prefix used for Rocketchat server url."
  default     = "chat"
}