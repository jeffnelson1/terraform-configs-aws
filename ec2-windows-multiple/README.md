# EC2 Windows-Multiple Terraform Config

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.20.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 ~> 4.20.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.instance_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_network_interface.nic_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vm_names"></a> [vm\_names](#input\_vm\_names) | n/a | `list(any)` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->