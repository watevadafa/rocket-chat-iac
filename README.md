# rocket-chat-iac
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0, < 2.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_backend"></a> [backend](#module\_backend) | ./modules/backend | n/a |
| <a name="module_rocketchat"></a> [rocketchat](#module\_rocketchat) | ./modules/rocketchat | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additonal_aws_tags"></a> [additonal\_aws\_tags](#input\_additonal\_aws\_tags) | Key-Value map of tags to apply across all resources handled by AWS provider. | `map(string)` | `{}` | no |
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | This is the access key for AWS IAM in use. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | This is the AWS Region used for creating the Resources. | `string` | n/a | yes |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | This is the secret key for AWS IAM in use. | `string` | n/a | yes |
| <a name="input_chat_sub_domain"></a> [chat\_sub\_domain](#input\_chat\_sub\_domain) | This is sub-domain prefix used for Rocketchat server url. | `string` | `"chat"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | This is the Project's primary domain name used in AWS Route53. | `string` | n/a | yes |
| <a name="input_ec2_instance_type"></a> [ec2\_instance\_type](#input\_ec2\_instance\_type) | This is AWS Ec2 instance type to be used for chat server. | `string` | `"t2.micro"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | This is the Environment name for the resources. | `string` | `"production"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | This is the Project name for which the resources are used. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->