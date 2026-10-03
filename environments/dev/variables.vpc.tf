variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
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