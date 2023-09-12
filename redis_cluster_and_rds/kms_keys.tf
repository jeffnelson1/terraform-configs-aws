## DB RDS KMS Key
data "aws_iam_policy_document" "rds_key_policy" {
  statement {
    sid    = "Enable Full KMS Access Permissions."
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = var.kms_rds_admins
    }
    actions = [
      "kms:*",
    ]
    resources = [
      "*"
    ]
  }

  statement {
    sid    = "Enable Partial IAM User Permissions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = var.rds_users
    }
    actions = [
      "kms:Describe*",
      "kms:List*",
      "kms:Get*",
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_kms_key" "ds_key" {
  description         = var.rds_key_desc
  enable_key_rotation = true
  multi_region        = true
  tags                = local.tags
  policy              = data.aws_iam_policy_document.rds_key_policy.json
}

resource "aws_kms_alias" "rds_key_alias" {
  target_key_id = aws_kms_key.rds_key.id
  name          = "alias/${var.rds_key_name}"
}