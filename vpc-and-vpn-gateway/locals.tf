locals {
  region                  = "us-east-1"
  transit_gw_subnets      = ["10.10.0.0/24", "10.10.1.0/24", "10.10.0.2/24"]
  transit_gw_subnet_names = ["prod-tgw-subnet-us-east-1a", "prod-tgw-subnet-us-east-1b", "prod-tgw-subnet-us-east-1c"]
  azs                     = ["${local.region}a", "${local.region}b", "${local.region}c"]

  ## VPN Locals
  vpn_gateway_name      = "vpn-gw-prod"
  vpn_connection_name   = "vpn-conn-prod"
  customer_gateway_name = "cust-gw-prod-ip1"

  ## Tags
  tags = {
    Environment = "prod"
  }
}