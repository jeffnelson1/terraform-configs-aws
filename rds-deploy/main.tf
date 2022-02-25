terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "default" {
  allocated_storage   = 10
  identifier          = "db-terra-01"
  engine              = "mysql"
  engine_version      = "8.0.21"
  instance_class      = "db.t2.micro"
  name                = "dbterraform01"
  username            = "admin"
  password            = "Enter password"

  tags = {
    Name        = "dbterraform01"
    Environment = "lab"
  }
}