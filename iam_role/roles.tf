## dev_ec2_role IAM Role
resource "aws_iam_role" "ec2_role" {
  name        = var.ec2_role_name
  description = var.ec2_role_description
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Environment = "prod"
  }
}

data "aws_iam_policy" "ec2_policies" {
  count = length(var.ec2_policy_names)
  name  = var.ec2_policy_names[count.index]
}

resource "aws_iam_role_policy_attachment" "attach_ec2_policies" {
  count      = length(var.ec2_policy_names)
  role       = aws_iam_role.ec2_role.name
  policy_arn = data.aws_iam_policy.ec2_policies.*.arn[count.index]
}