resource "aws_kms_key" "backup_vault" {
  description             = var.backup_vault_key_desc
  deletion_window_in_days = 10
}

resource "aws_kms_alias" "backup_vault" {
  name          = "alias/${var.backup_vault_key_name}"
  target_key_id = aws_kms_key.backup_vault.key_id
}
