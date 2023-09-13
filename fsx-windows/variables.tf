## EBS Key variables
variable "fsx_admins" {
  type        = list(any)
  default     = ["arn:aws:iam::00000000:root"]
  description = "ARNs that have full access to the FSx key."
}

variable "fsx_users" {
  type = list(any)
  default = ["arn:aws:iam::0000000:user/user1",
    "arn:aws:iam::11111111:user/user1",
    "arn:aws:iam::222222222:user/user1",
  ]
  description = "ARNs that have partial access to the FSx key."
}

variable "fsx_key_name" {
  type        = string
  default     = "fsx_key"
  description = "Name of the FSx Key."
}

variable "fsx_key_desc" {
  type        = string
  default     = "This is a mult-region key that will be used as the FSx key."
  description = "FSx Key Description"
}