variable "aws_region" {
  description = "AWS region for the application."
  type        = string
}
variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}
variable "instance_key_pair" {
  description = "Existing EC2 key pair name."
  type        = string
}
variable "ssh_cidr" {
  description = "IPv4 CIDR allowed to connect over SSH."
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to create."
  type        = number
  default     = 2
}
