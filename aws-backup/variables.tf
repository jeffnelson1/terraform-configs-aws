variable "backup_vault_key_name" {
  type        = string
  default     = "backup_vault_key"
  description = "Name of the Backup Vault KMS Key."
}

variable "backup_vault_key_desc" {
  type        = string
  default     = "backup_vault_key_desc"
  description = "This key is used to encrypt backup vaults."
}
