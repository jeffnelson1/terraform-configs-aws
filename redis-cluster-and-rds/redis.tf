resource "aws_elasticache_subnet_group" "sub_group" {
  name       = var.redis_subnet_group_name
  subnet_ids = var.redis_subnet_ids
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = var.redis_cluster_id
  engine               = var.engine_type
  node_type            = var.redis_node_size
  num_cache_nodes      = var.cache_node_count
  parameter_group_name = var.redis_parameter_group_name
  engine_version       = var.redis_engine_version
  port                 = var.redis_port
  subnet_group_name    = aws_elasticache_subnet_group.sub_group.name
  security_group_ids   = [aws_security_group.redis_sg.id]
}