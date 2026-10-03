# outputs the VPC ID
output "vpc_id" {
  value = module.my-vpc-network.vpc_id
}


# output the private subnets IDs
output "private_subnet_ids" {
  value = module.my-vpc-network.private_subnet_ids
}

# output the public subnets IDs
output "public_subnet_ids" {
  value = module.my-vpc-network.public_subnet_ids
}


# output the database subnets IDs
output "database_subnet_ids" {
  value = module.my-vpc-network.database_subnet_ids
}

# output the NAT gateway ID
output "nat_gateway_id" {
  value = module.my-vpc-network.nat_gateway_id
}

# output the internet gateway ID
output "internet_gateway_id" {
  value = module.my-vpc-network.internet_gateway_id
}

# output the route table IDs for private subnets
output "private_route_table_ids" {
  value = module.my-vpc-network.private_route_table_ids
}


# output the route table IDs for public subnets
output "public_route_table_ids" {
  value = module.my-vpc-network.public_route_table_ids
}

# output the route table IDs for database subnets
output "database_route_table_ids" {
  value = module.my-vpc-network.database_route_table_ids
}