variable "name" {
  description = "Security group name in the default VPC."
  type        = string
  default     = "vpc-ssh"
}
variable "ssh_cidr" {
  description = "Allowed IPv4 CIDR for SSH."
  type        = string
}
