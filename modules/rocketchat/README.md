<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.chat_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.instance_key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_route53_record.chat_url](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.allow_ssh_https_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [tls_private_key.instance_public_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_ami.amazon_linux_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_route53_zone.hosted_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chat_sub_domain"></a> [chat\_sub\_domain](#input\_chat\_sub\_domain) | This is sub-domain prefix used for Rocketchat server url. | `string` | `"chat"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | This is the Project's primary domain name used in AWS Route53. | `string` | n/a | yes |
| <a name="input_ec2_instance_type"></a> [ec2\_instance\_type](#input\_ec2\_instance\_type) | This is AWS Ec2 instance type to be used for chat server. | `string` | `"t2.micro"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | This is the Environment name for the resources. | `string` | `"production"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | This is the Project name for which the resources are used. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region that the resources will be created | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->