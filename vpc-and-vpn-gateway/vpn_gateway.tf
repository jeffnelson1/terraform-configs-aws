module "vpn_gateway" {
  source  = "terraform-aws-modules/vpn-gateway/aws"
  version = "~> 2.12.1"

  vpc_id                                    = module.vpc_prod.vpc_id
  vpn_gateway_id                            = module.vpc_prod.vgw_id
  customer_gateway_id                       = module.vpc_prod.cgw_ids[0]
  local_ipv4_network_cidr                   = "10.10.0.0/16"
  remote_ipv4_network_cidr                  = "10.20.0.0/21"
  vpn_connection_static_routes_only         = true
  vpn_connection_static_routes_destinations = ["10.20.0.0/16"]
  tunnel1_ike_versions                      = ["ikev2"]
  tunnel2_ike_versions                      = ["ikev2"]

  vpc_subnet_route_table_count = 4
  vpc_subnet_route_table_ids   = module.vpc_prod.private_route_table_ids

  tags = merge(
    local.tags,
    {
      Name = local.vpn_connection_name
    }
  )
}
