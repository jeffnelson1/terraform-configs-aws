# FSx Terraform Config

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.20.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.20.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_fsx_windows_file_system.fsx_file_shares](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/fsx_windows_file_system) | resource |
| [aws_kms_alias.fsx_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.fsx_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_iam_policy_document.fsx_key_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_secretsmanager_secret.fsx_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret.fsx_username](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [aws_secretsmanager_secret_version.username](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fsx_admins"></a> [fsx\_admins](#input\_fsx\_admins) | ARNs that have full access to the FSx key. | `list(any)` | <pre>[<br>  "arn:aws:iam::00000000:root"<br>]</pre> | no |
| <a name="input_fsx_key_desc"></a> [fsx\_key\_desc](#input\_fsx\_key\_desc) | FSx Key Description | `string` | `"This is a mult-region key that will be used as the FSx key."` | no |
| <a name="input_fsx_key_name"></a> [fsx\_key\_name](#input\_fsx\_key\_name) | Name of the FSx Key. | `string` | `"fsx_key"` | no |
| <a name="input_fsx_users"></a> [fsx\_users](#input\_fsx\_users) | ARNs that have partial access to the FSx key. | `list(any)` | <pre>[<br>  "arn:aws:iam::0000000:user/user1",<br>  "arn:aws:iam::11111111:user/user1",<br>  "arn:aws:iam::222222222:user/user1"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fsx_arn"></a> [fsx\_arn](#output\_fsx\_arn) | The ARN of the FSx file system |
| <a name="output_fsx_dns_name"></a> [fsx\_dns\_name](#output\_fsx\_dns\_name) | Public DNS name for the FSx filesystem |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->