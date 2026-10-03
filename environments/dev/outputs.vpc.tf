# outputs the VPC ID
output "vpc_id" {
  value = module.vpc.vpc_id
}

# output the private subnets IDs
output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

# output the public subnets IDs
output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}


# output the database subnets IDs
output "database_subnet_ids" {
  value = module.vpc.database_subnet_ids
}

# output the NAT gateway ID
output "nat_gateway_id" {
  value = module.vpc.nat_gateway_id
}

# output the internet gateway ID
output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

# output the route table IDs for private subnets
output "private_route_table_ids" {
  value = module.vpc.private_route_table_ids
}


# output the route table IDs for public subnets
output "public_route_table_ids" {
  value = module.vpc.public_route_table_ids
}

# output the route table IDs for database subnets
output "database_route_table_ids" {
  value = module.vpc.database_route_table_ids
}