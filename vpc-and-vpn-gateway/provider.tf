terraform {
  required_version = ">= 1.1.7"
  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.20.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
