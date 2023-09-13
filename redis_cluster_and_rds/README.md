# Redis and RDS TF Config

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
| <a name="module_rds"></a> [rds](#module\_rds) | terraform-aws-modules/rds/aws | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_cluster.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster) | resource |
| [aws_elasticache_subnet_group.sub_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_kms_alias.rds_key_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.rds_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_security_group.rds_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.redis_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_iam_policy_document.rds_key_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cache_node_count"></a> [cache\_node\_count](#input\_cache\_node\_count) | Number of cache nodes. | `number` | `1` | no |
| <a name="input_engine_type"></a> [engine\_type](#input\_engine\_type) | Type of Elasticache engine | `string` | `"redis"` | no |
| <a name="input_key_desc"></a> [key\_desc](#input\_key\_desc) | RDS Key Description | `string` | `"This is a mult-region key that will be used as the RDS key."` | no |
| <a name="input_rds_admins"></a> [rds\_admins](#input\_rds\_admins) | ARNs that have full access to the rds key. | `list(any)` | <pre>[<br>  "arn:aws:iam::00000000:root"<br>]</pre> | no |
| <a name="input_rds_key_name"></a> [rds\_key\_name](#input\_rds\_key\_name) | Name of the RDS Key. | `string` | `"rds_key"` | no |
| <a name="input_rds_users"></a> [rds\_users](#input\_rds\_users) | ARNs that have partial access to the rds key. | `list(any)` | <pre>[<br>  "arn:aws:iam::000000:user/jnelson",<br>  "arn:aws:iam::0000000:user/jnelson",<br>  "arn:aws:iam::0000000:user/jnelson"<br>]</pre> | no |
| <a name="input_redis_cluster_id"></a> [redis\_cluster\_id](#input\_redis\_cluster\_id) | Cluster ID for the Redis cluster | `string` | `"redis"` | no |
| <a name="input_redis_engine_version"></a> [redis\_engine\_version](#input\_redis\_engine\_version) | Engine version | `string` | `"3.2.10"` | no |
| <a name="input_redis_node_size"></a> [redis\_node\_size](#input\_redis\_node\_size) | Size of Redis node | `string` | `"cache.r5.xlarge"` | no |
| <a name="input_redis_parameter_group_name"></a> [redis\_parameter\_group\_name](#input\_redis\_parameter\_group\_name) | Name of parameter group | `string` | `"default.redis3.2"` | no |
| <a name="input_redis_port"></a> [redis\_port](#input\_redis\_port) | Redis port number | `number` | `6379` | no |
| <a name="input_redis_subnet_group_name"></a> [redis\_subnet\_group\_name](#input\_redis\_subnet\_group\_name) | Name of the subnet group name | `string` | `"redis-subnet-group"` | no |
| <a name="input_redis_subnet_ids"></a> [redis\_subnet\_ids](#input\_redis\_subnet\_ids) | Subnet IDs for Redis subnet group | `list(any)` | <pre>[<br>  "subnet-0000000",<br>  "subnet-11111111",<br>  "subnet-22222222"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rds_address"></a> [rds\_address](#output\_rds\_address) | Address of the RDS SQL Instance |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | The endpoint of the RDS SQL Instance |
| <a name="output_redis_arn"></a> [redis\_arn](#output\_redis\_arn) | The ARN of the Elasticache cluster |
| <a name="output_redis_security_group_arn"></a> [redis\_security\_group\_arn](#output\_redis\_security\_group\_arn) | The ARN of the Security Group for Redis |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->