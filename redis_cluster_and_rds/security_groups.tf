## Redis Security Group
resource "aws_security_group" "redis_sg" {
  name        = "redis-sg"
  description = "Allow Redis inbound traffic"
  vpc_id      = "vpc-00000000"

  ingress {
    description = "MSSQL Traffic from VPC"
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["10.8.0.0/24",
                   "10.8.1.0/24"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_redis_traffic"
  }
}

## DB Security Group
resource "aws_security_group" "rds_sg" {
  name        = "sql-sg"
  description = "Allow MSSQL inbound traffic"
  vpc_id      = "vpc-00000000"

  ingress {
    description = "MSSQL Traffic from VPC"
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["10.8.0.0/24",
                   "10.8.1.0/24"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_mssql_traffic"
  }
}