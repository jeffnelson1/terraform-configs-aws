locals {
  region = "us-east-1"
  azs    = ["${local.region}a", "${local.region}b", "${local.region}c"]
  tags = {
    Environment = "dev"
  }
}