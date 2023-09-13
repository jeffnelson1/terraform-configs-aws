## FSx KMS Key
data "aws_iam_policy_document" "fsx_key_policy" {
  statement {
    sid    = "Enable Full KMS Access Permissions."
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = var.fsx_admins
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
      identifiers = var.fsx_users
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
resource "aws_kms_key" "fsx_key" {
  description         = var.fsx_key_desc
  enable_key_rotation = true
  multi_region        = true
  tags                = local.tags
  policy              = data.aws_iam_policy_document.fsx_key_policy.json
}

resource "aws_kms_alias" "fsx_key" {
  target_key_id = aws_kms_key.fsx_key.id
  name          = "alias/${var.fsx_key_name}"
}