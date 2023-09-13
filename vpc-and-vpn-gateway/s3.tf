module "s3_bucket_vpc_logs" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.3.0"

  bucket                  = "vpc-flow-logs-prod-23212"
  block_public_acls       = "true"
  block_public_policy     = "true"
  ignore_public_acls      = "true"
  restrict_public_buckets = "true"

  versioning = {
    enabled = false
  }

  tags = local.tags
}