## Primary backup vault
resource "aws_backup_vault" "vault_primary" {
  name        = "${local.tags.Environment}_vault_primary"
  kms_key_arn = aws_kms_key.backup_vault.arn
  tags        = local.tags
}

## Backup Plan
resource "aws_backup_plan" "plan" {
  name = local.tags.Environment
  tags = local.tags

  advanced_backup_setting {
    backup_options = {
      WindowsVSS = "disabled"
    }
    resource_type = "EC2"
  }

  rule {
    rule_name         = "daily"
    target_vault_name = aws_backup_vault.vault_primary.name
    schedule          = "cron(0 6 ? * * *)"
    recovery_point_tags = {
      Environment = local.tags.Environment
    }
    start_window      = 60
    completion_window = 180

    lifecycle {
      cold_storage_after = 30
      delete_after       = 121
    }
  }

  rule {
    rule_name         = "weekly"
    target_vault_name = aws_backup_vault.vault_primary.name
    schedule          = "cron(0 6 ? * 1 *)"
    recovery_point_tags = {
      Environment = local.tags.Environment
    }
    start_window      = 60
    completion_window = 180

    lifecycle {
      cold_storage_after = 30
      delete_after       = 121
    }
  }

  rule {
    rule_name         = "monthly"
    target_vault_name = aws_backup_vault.vault_primary.name
    schedule          = "cron(0 06 31 * ? *)"
    recovery_point_tags = {
      Environment = local.tags.Environment
    }
    start_window      = 60
    completion_window = 180

    lifecycle {
      cold_storage_after = 30
      delete_after       = 121
    }
  }
}

data "aws_iam_role" "backup_role_prod" {
  name = "AWSBackupDefaultServiceRole"
}

resource "aws_backup_selection" "prod" {
  iam_role_arn = data.aws_iam_role.backup_role_prod.arn
  name         = "${local.tags.Environment}_plan_tags"
  plan_id      = aws_backup_plan.plan.id
  resources    = ["arn:aws:ec2:*:*:instance/*"]

  condition {
    string_equals {
      key   = "aws:ResourceTag/Environment"
      value = "prod"
    }
  }
}

## Adhoc Backup Resources
## Primary backup vault
resource "aws_backup_vault" "adhoc" {
  name        = "adhoc_vault_primary"
  kms_key_arn = aws_kms_key.backup_vault.arn
  tags = {
    Environment = "adhoc"
  }
}

## Backup Plan
resource "aws_backup_plan" "adhoc" {
  name = "adhoc"
  tags = {
    Environment = "adhoc"
  }

  advanced_backup_setting {
    backup_options = {
      WindowsVSS = "disabled"
    }
    resource_type = "EC2"
  }

  rule {
    rule_name         = "daily"
    target_vault_name = aws_backup_vault.adhoc.name
    schedule          = "cron(0 6 ? * * *)"
    recovery_point_tags = {
      Environment = "adhoc"
    }
    start_window      = 60
    completion_window = 180

    lifecycle {
      delete_after = 30
    }
  }

  rule {
    rule_name         = "weekly"
    target_vault_name = aws_backup_vault.adhoc.name
    schedule          = "cron(0 6 ? * 1 *)"
    recovery_point_tags = {
      Environment = "adhoc"
    }
    start_window      = 60
    completion_window = 180

    lifecycle {
      delete_after = 30
    }
  }

  rule {
    rule_name         = "monthly"
    target_vault_name = aws_backup_vault.adhoc.name
    schedule          = "cron(0 06 31 * ? *)"
    recovery_point_tags = {
      Environment = "adhoc"
    }
    start_window      = 60
    completion_window = 180

    lifecycle {
      delete_after = 30
    }
  }

}

data "aws_iam_role" "backup_role_adhoc" {
  name = "AWSBackupDefaultServiceRole"
}

resource "aws_backup_selection" "adhoc" {
  iam_role_arn = data.aws_iam_role.backup_role_adhoc.arn
  name         = "adhoc_plan_tags"
  plan_id      = aws_backup_plan.adhoc.id
  resources    = ["arn:aws:ec2:*:*:instance/*"]

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Environment"
    value = "adhoc"
  }
}
