## VPC PROD Module Outputs

output "prod_vpc_id" {
  description = "The ID of the environment VPC"
  value       = module.vpc_prod.vpc_id
}

output "prod_vpc_cidr_block" {
  description = "The CIDR block of the environment VPC"
  value       = module.vpc_prod.vpc_cidr_block
}

output "prod_private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc_prod.private_subnets
}

output "prod_public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc_prod.public_subnets
}

output "prod_database_subnets" {
  description = "List of IDs of database subnets"
  value       = module.vpc_prod.database_subnets
}

output "prod_flowlog_s3_bucket_id" {
  description = "The ID of S3 bucket for Prod VPC Flow Logs"
  value       = module.s3_bucket_vpc_logs.s3_bucket_id
}