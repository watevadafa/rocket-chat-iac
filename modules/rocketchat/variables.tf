variable "environment" {
  type        = string
  default     = "production"
  description = "This is the Environment name for the resources."
}

variable "project_name" {
  type        = string
  description = "This is the Project name for which the resources are used."
}

variable "region" {
  type        = string
  description = "Region that the resources will be created"
}

variable "domain_name" {
  type        = string
  description = "This is the Project's primary domain name used in AWS Route53."
}

variable "chat_sub_domain" {
  type        = string
  description = "This is sub-domain prefix used for Rocketchat server url."
  default     = "chat"
}
variable "ec2_instance_type" {
  type        = string
  description = "This is AWS Ec2 instance type to be used for chat server."
  default     = "t2.micro"
}