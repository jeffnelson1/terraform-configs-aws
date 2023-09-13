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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_bucket_vpc_logs"></a> [s3\_bucket\_vpc\_logs](#module\_s3\_bucket\_vpc\_logs) | terraform-aws-modules/s3-bucket/aws | 3.3.0 |
| <a name="module_vpc_prod"></a> [vpc\_prod](#module\_vpc\_prod) | terraform-aws-modules/vpc/aws | =3.14.2 |
| <a name="module_vpn_gateway"></a> [vpn\_gateway](#module\_vpn\_gateway) | terraform-aws-modules/vpn-gateway/aws | ~> 2.12.1 |

## Resources

| Name | Type |
|------|------|
| [aws_flow_log.vcp_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_subnet.tgw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc_endpoint.api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.datasync](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.ec2_messages](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.events](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.monitoring](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.secrets_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.ssm_messages](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.sts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_prod_database_subnets"></a> [prod\_database\_subnets](#output\_prod\_database\_subnets) | List of IDs of database subnets |
| <a name="output_prod_flowlog_s3_bucket_id"></a> [prod\_flowlog\_s3\_bucket\_id](#output\_prod\_flowlog\_s3\_bucket\_id) | The ID of S3 bucket for Prod VPC Flow Logs |
| <a name="output_prod_private_subnets"></a> [prod\_private\_subnets](#output\_prod\_private\_subnets) | List of IDs of private subnets |
| <a name="output_prod_public_subnets"></a> [prod\_public\_subnets](#output\_prod\_public\_subnets) | List of IDs of public subnets |
| <a name="output_prod_vpc_cidr_block"></a> [prod\_vpc\_cidr\_block](#output\_prod\_vpc\_cidr\_block) | The CIDR block of the environment VPC |
| <a name="output_prod_vpc_id"></a> [prod\_vpc\_id](#output\_prod\_vpc\_id) | The ID of the environment VPC |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->