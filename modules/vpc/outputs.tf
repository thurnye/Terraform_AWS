# Add VPC outputs here when needed.
# outputs the VPC ID
output "vpc_id" {
  value = module.vpc.vpc_id
}

# output the private subnet IDs
output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

# output the public subnet IDs
output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

# output the database subnet IDs
output "database_subnet_ids" {
  value = module.vpc.database_subnets
}

# output the NAT gateway IDs
output "nat_gateway_id" {
  value = module.vpc.natgw_ids
}

# output the internet gateway ID
output "internet_gateway_id" {
  value = module.vpc.igw_id
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
