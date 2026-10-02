variable "instance_ami" {
  description = "EC2 instance ami"
  type = string
}

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

variable "instance_type_list" {
  description = "List of EC2 instance types."
  type        = list(string)
  default     = ["t3.micro", "t3.small", "t3.medium"]
}

variable "instance_type_map" {
  description = "Map of EC2 instance types."
  type        = map(string)
  default     = {
    "dev"  = "t3.micro"
    "qa" = "t3.small"
    "prod"  = "t3.large"
  }
}

variable "instance_count" {
  description = "Number of EC2 instances to create."
  type        = number
  default     = 1
}

variable "availability_zone" {
  description = "Availability zone for the EC2 instance."
  type        = string
  default     = "us-east-1a"
}