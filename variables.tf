# Input Variables


# AWS Region
variable "aws_region" {
  description = "Region in which aws resources will be created"
  type = string
  default = "us-east-1"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "Type of EC2 instance to be created"
  type = string
  default = "t3.micro"
}

# AWS EC2 Instance Key Pair
variable "instance_key_pair" {
  description = "Name of the EC2 Key Pair to be used"
  type = string
  default = "class2026"
}