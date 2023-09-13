## Redis Outputs
output "redis_arn" {
  description = "The ARN of the Elasticache cluster"
  value       = aws_elasticache_cluster._redis.arn
}

output "redis_security_group_arn" {
  description = "The ARN of the Security Group for Redis"
  value       = aws_security_group.redis_sg.arn
}

##  RDS SQL Outputs
output "rds_address" {
  description = "Address of the RDS SQL Instance"
  value       = module.rds.db_instance_address
}

output "rds_endpoint" {
  description = "The endpoint of the RDS SQL Instance"
  value       = module.rds.db_instance_endpoint
}