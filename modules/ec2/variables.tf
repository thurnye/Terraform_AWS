variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}
variable "instance_key_pair" {
  description = "Existing EC2 key pair name."
  type        = string
}
variable "security_group_ids" {
  description = "Security groups attached to the instance."
  type        = list(string)
}
variable "name" {
  description = "EC2 Name tag."
  type        = string
  default     = "My_EC2_Instance_Demo"
}
