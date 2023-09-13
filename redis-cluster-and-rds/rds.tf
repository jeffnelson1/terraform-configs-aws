module "rds" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "mssql"

  engine            = "sqlserver-ee"
  engine_version    = "14.00.3381.3.v1"
  instance_class    = "db.m6i.8xlarge"
  allocated_storage = 2010

  # DB parameter group
  family = "sqlserver-ee-14.0"

  # DB option group
  major_engine_version = "14.00"

  username                            = "sqladmin"
  iam_database_authentication_enabled = false

  license_model = "license-included"

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids = ["subnet-0000000",
    "subnet-11111111",
    "subnet-222222222222"
  ]
  db_subnet_group_name            = "sql-subnet-group"
  db_subnet_group_description     = "Subnet group for SQL DB"
  db_subnet_group_use_name_prefix = false

  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  key_id = aws_key.rds_key.arn

  deletion_protection = true

  backup_window = "02:00-09:00"

  monitoring_interval    = "30"
  monitoring_role_name   = "sql_rds_monitoring_role"
  create_monitoring_role = true

  tags = local.tags
}
