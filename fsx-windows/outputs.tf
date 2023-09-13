## Storage outputs
output "fsx_arn" {
  description = "The ARN of the FSx file system"
  value       = aws_fsx_windows_file_system.fsx_file_shares.arn
}

output "fsx_dns_name" {
  description = "Public DNS name for the FSx filesystem"
  value       = aws_fsx_windows_file_system.fsx_file_shares.dns_name
}


