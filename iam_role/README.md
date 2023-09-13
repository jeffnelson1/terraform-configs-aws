# EC2 Windows-Multiple Terraform Config

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
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
| [aws_iam_role.ec2_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.attach_ec2_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy.ec2_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ec2_policy_names"></a> [ec2\_policy\_names](#input\_ec2\_policy\_names) | Names of the policies that will be attached to the role. | `list(any)` | <pre>[<br>  "AmazonSSMManagedInstanceCore",<br>  "CloudWatchAgentAdminPolicy"<br>]</pre> | no |
| <a name="input_ec2_role_description"></a> [ec2\_role\_description](#input\_ec2\_role\_description) | Description of the ec2 role name. | `string` | `"IAM role that grants EC2 instances to SSM and Cloudwatch."` | no |
| <a name="input_ec2_role_name"></a> [ec2\_role\_name](#input\_ec2\_role\_name) | Name of the ec2 role name. | `string` | `"dev_ec2_role"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->