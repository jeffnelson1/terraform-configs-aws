resource "aws_fsx_windows_file_system" "fsx_file_shares" {
  storage_type     = "SSD"
  storage_capacity = 3500
  subnet_ids = ["subnet-0000000",
  "subnet-1111111"]
  preferred_subnet_id = "subnet-00000000"
  throughput_capacity = 1024
  deployment_type     = "MULTI_AZ_1"
  kms_key_id          = aws_kms_key.fsx_key.arn
  tags = merge(
    local.tags,
    {
      Name = "file_shares"
    }
  )

  self_managed_active_directory {
    dns_ips                                = ["10.10.10.3", "10.10.10.4"]
    domain_name                            = "domain.com"
    organizational_unit_distinguished_name = "OU=domain,DC=dom,DC=com"
    password                               = jsondecode(data.aws_secretsmanager_secret_version.password.secret_string)["fsx_password"]
    username                               = jsondecode(data.aws_secretsmanager_secret_version.username.secret_string)["fsx_username"]
  }
}