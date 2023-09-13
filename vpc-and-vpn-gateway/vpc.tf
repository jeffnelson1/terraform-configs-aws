module "vpc_prod" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "=3.14.2"

  name = "infra-prod"
  cidr = "10.10.0.0/16"

  azs = ["${local.region}a", "${local.region}b", "${local.region}c", "${local.region}d"]

  private_subnets       = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24"]
  private_subnet_suffix = "private-subnet"

  public_subnets       = ["10.10.6.0/26", "10.10.6.64/26", "10.10.6.128/26"]
  public_subnet_suffix = "public-subnet"

  database_subnets       = ["10.10.0.96/27", "10.10.0.128/27", "10.10.0.160/27"]
  database_subnet_suffix = "db-subnet"

  enable_nat_gateway = true

  ## VPN Config
  enable_vpn_gateway = true
  amazon_side_asn    = 64520
  customer_gateways = {
    IP1 = {
      bgp_asn    = 65123
      ip_address = "1.1.1.1"
    }
  }

  customer_gateway_tags = merge(
    local.tags,
    {
      Name = local.customer_gateway_name
    }
  )

  vpn_gateway_tags = merge(
    local.tags,
    {
      Name = local.vpn_gateway_name
    }
  )
  tags = local.tags
}
resource "aws_subnet" "tgw" {
  vpc_id            = module.vpc_prod.vpc_id
  count             = length(local.transit_gw_subnets)
  cidr_block        = local.transit_gw_subnets[count.index]
  availability_zone = local.azs[count.index]

  tags = {
    Name = local.transit_gw_subnet_names[count.index]
  }
}

## VPC Flow Logs
resource "aws_flow_log" "vcp_logs" {
  log_destination      = module.s3_bucket_vpc_logs.s3_bucket_arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = module.vpc_prod.vpc_id
}

## S3 Endpoint
resource "aws_vpc_endpoint" "s3" {
  vpc_id          = module.vpc_prod.vpc_id
  service_name    = "com.amazonaws.us-east-1.s3"
  route_table_ids = concat(module.vpc_prod.private_route_table_ids, module.vpc_prod.database_route_table_ids)
}

## EC2 Endpoint
resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = module.vpc_prod.vpc_id
  service_name      = "com.amazonaws.us-east-1.ec2"
  vpc_endpoint_type = "Interface"
  subnet_ids        = module.vpc_prod.private_subnets
}

## Execute API Endpoint
resource "aws_vpc_endpoint" "api" {
  vpc_id            = module.vpc_prod.vpc_id
  service_name      = "com.amazonaws.us-east-1.execute-api"
  vpc_endpoint_type = "Interface"
  subnet_ids        = module.vpc_prod.private_subnets
}

## Secrets Manager Endpoint
resource "aws_vpc_endpoint" "secrets_manager" {
  vpc_id            = module.vpc_prod.vpc_id
  service_name      = "com.amazonaws.us-east-1.secretsmanager"
  vpc_endpoint_type = "Interface"
  subnet_ids        = module.vpc_prod.private_subnets
}

## SSM Endpoint
resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = module.vpc_prod.vpc_id
  service_name      = "com.amazonaws.us-east-1.ssm"
  vpc_endpoint_type = "Interface"
  subnet_ids        = module.vpc_prod.private_subnets
}

## Monitoring Endpoint
resource "aws_vpc_endpoint" "monitoring" {
  vpc_id            = module.vpc_prod.vpc_id
  service_name      = "com.amazonaws.us-east-1.monitoring"
  vpc_endpoint_type = "Interface"
  subnet_ids        = module.vpc_prod.private_subnets
}

## EC2 Messages Endpoint
resource "aws_vpc_endpoint" "ec2_messages" {
  vpc_id            = module.vpc_prod.vpc_id
  service_name      = "com.amazonaws.us-east-1.ec2messages"
  vpc_endpoint_type = "Interface"
  subnet_ids        = module.vpc_prod.private_subnets
}

## Events Endpoint
resource "aws_vpc_endpoint" "events" {
  vpc_id            = module.vpc_prod.vpc_id
  service_name      = "com.amazonaws.us-east-1.events"
  vpc_endpoint_type = "Interface"
  subnet_ids        = module.vpc_prod.private_subnets
}

## Logs Endpoint
resource "aws_vpc_endpoint" "logs" {
  vpc_id            = module.vpc_prod.vpc_id
  service_name      = "com.amazonaws.us-east-1.logs"
  vpc_endpoint_type = "Interface"
  subnet_ids        = module.vpc_prod.private_subnets
}

## SSM Messages Endpoint
resource "aws_vpc_endpoint" "ssm_messages" {
  vpc_id            = module.vpc_prod.vpc_id
  service_name      = "com.amazonaws.us-east-1.ssmmessages"
  vpc_endpoint_type = "Interface"
  subnet_ids        = module.vpc_prod.private_subnets
}

## STS Endpoint
resource "aws_vpc_endpoint" "sts" {
  vpc_id            = module.vpc_prod.vpc_id
  service_name      = "com.amazonaws.us-east-1.sts"
  vpc_endpoint_type = "Interface"
  subnet_ids        = module.vpc_prod.private_subnets
}

## KMS Endpoint
resource "aws_vpc_endpoint" "kms" {
  vpc_id            = module.vpc_prod.vpc_id
  service_name      = "com.amazonaws.us-east-1.kms"
  vpc_endpoint_type = "Interface"
  subnet_ids        = module.vpc_prod.private_subnets
}

## DataSync Endpoint
resource "aws_vpc_endpoint" "datasync" {
  vpc_id            = module.vpc_prod.vpc_id
  service_name      = "com.amazonaws.us-east-1.datasync"
  vpc_endpoint_type = "Interface"
  subnet_ids        = module.vpc_prod.private_subnets
}