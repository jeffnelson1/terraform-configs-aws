variable "ec2_policy_names" {
  type        = list(any)
  default     = ["AmazonSSMManagedInstanceCore", "CloudWatchAgentAdminPolicy"]
  description = "Names of the policies that will be attached to the role."
}

variable "ec2_role_name" {
  type        = string
  default     = "dev_ec2_role"
  description = "Name of the ec2 role name."
}

variable "ec2_role_description" {
  type        = string
  default     = "IAM role that grants EC2 instances to SSM and Cloudwatch."
  description = "Description of the ec2 role name."
}