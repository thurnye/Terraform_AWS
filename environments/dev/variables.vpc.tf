# Add VPC input variables here when needed.
variable "name" {
  description = "Name for the VPC."
  type        = string
  default     = "vpc-dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "vpc_azs" {
  description = "List of availability zones for the VPC."
  type        = list(string)
  default     = []
}

variable "private_subnets"{
    description = "List of private subnet CIDR blocks."
    type = list(string)
    default = []
}
variable "public_subnets"{
    description = "List of public subnet CIDR blocks."
    type = list(string)
    default = []
}
variable "database_subnets"{
description = "List of database subnet CIDR blocks."
    type = list(string)
    default = []
}

variable "create_database_subnet_group" {
    description = "Whether to create a database subnet group."
    type        = bool

}

variable "create_database_subnet_route_table" {
    description = "Whether to create a database subnet route table."
    type        = bool
}

variable "create_database_internet_gateway_route_table" {
    description = "Whether to create a database internet gateway route table."
    type        = bool
}

variable "create_database_nat_gateway_route_table" {
    description = "Whether to create a database NAT gateway route table."
    type        = bool
}

variable "enable_nat_gateway" {
    description = "Whether to enable NAT gateway for outbound internet access from private subnets."
    type        = bool
    default     = true
    
}
variable "single_nat_gateway" {
    description = "Whether to create a single NAT gateway for the VPC."
    type        = bool
    default     = true

}
variable "enable_dns_hostnames" {
    description = "Whether to enable DNS hostnames in the VPC."
    type        = bool
    default     = true

}
variable "enable_dns_support" {
    description = "Whether to enable DNS support in the VPC."
    type        = bool
    default     = true
}
variable "public_subnet_tags"{
    description = "Tags for public subnets."
    type = map(string)
    default = {}
}
variable "private_subnet_tags"{
    description = "Tags for private subnets."
    type = map(string)
    default = {}
}
variable "database_subnet_tags"{
    description = "Tags for database subnets."
    type = map(string)
    default = {}
}
variable "vpc_tags"{
    description = "Tags for the VPC."
    type = map(string)
    default = {}
}
variable "tags"{
    description = "Tags for the VPC and its resources."
    type = map(string)
    default = {}
}
