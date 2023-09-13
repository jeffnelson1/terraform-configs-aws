## Retreive the FSx svc account password
data "aws_secretsmanager_secret" "fsx_password" {
  name = "prod/fsx_svc_acct_password"
}

data "aws_secretsmanager_secret_version" "password" {
  secret_id = data.aws_secretsmanager_secret.fsx_password.id
}

## Retreive the FSx svc account username
data "aws_secretsmanager_secret" "fsx_username" {
  name = "prod/fsx_svc_acct_username"
}

data "aws_secretsmanager_secret_version" "username" {
  secret_id = data.aws_secretsmanager_secret.fsx_username.id
}