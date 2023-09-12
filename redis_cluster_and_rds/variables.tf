## Redis Cluster

variable "redis_subnet_ids" {
  type = list(any)
  default = ["subnet-0000000",
    "subnet-11111111",
  "subnet-22222222"]
  description = "Subnet IDs for Redis subnet group"
}

variable "redis_subnet_group_name" {
  type        = string
  default     = "redis-subnet-group"
  description = "Name of the subnet group name"
}

variable "redis_cluster_id" {
  type        = string
  default     = "redis"
  description = "Cluster ID for the Redis cluster"
}

variable "engine_type" {
  type        = string
  default     = "redis"
  description = "Type of Elasticache engine"
}

variable "redis_node_size" {
  type        = string
  default     = "cache.r5.xlarge"
  description = "Size of Redis node"
}

variable "cache_node_count" {
  type        = number
  default     = 1
  description = "Number of cache nodes."
}

variable "redis_parameter_group_name" {
  type        = string
  default     = "default.redis3.2"
  description = "Name of parameter group"
}

variable "redis_engine_version" {
  type        = string
  default     = "3.2.10"
  description = "Engine version"
}

variable "redis_port" {
  type        = number
  default     = 6379
  description = "Redis port number"
}

## RDS Key variables
variable "rds_admins" {
  type        = list(any)
  default     = ["arn:aws:iam::00000000:root"]
  description = "ARNs that have full access to the rds key."
}

variable "rds_users" {
  type = list(any)
  default = ["arn:aws:iam::000000:user/jnelson",
    "arn:aws:iam::0000000:user/jnelson",
    "arn:aws:iam::0000000:user/jnelson",
  ]
  description = "ARNs that have partial access to the rds key."
}

variable "rds_key_name" {
  type        = string
  default     = "rds_key"
  description = "Name of the RDS Key."
}

variable "key_desc" {
  type        = string
  default     = "This is a mult-region key that will be used as the RDS key."
  description = "RDS Key Description"
}