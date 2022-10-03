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

variable "aws_ami_name" {
  type        = string
  description = "This is name prefix used for filtering AWS AMI."
  default     = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
}

variable "aws_ami_virtualization" {
  type        = string
  description = "This is virtualization-type used for filtering AWS AMI."
  default     = "hvm"
}

variable "aws_ami_architecture" {
  type        = string
  description = "This is name prefix used for filtering AWS AMI."
  default     = "x86_64"
}

variable "lets_encrypt_email" {
  type        = string
  description = "This is email used to get an SSL Certificate from Let's Encrypt for chat server."
}
