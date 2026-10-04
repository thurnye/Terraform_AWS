aws_region        = "us-east-1"
instance_type     = "t3.micro"
instance_key_pair = "class2026"

# Preserves the existing rule; use your public IP/32 to restrict SSH.
ssh_cidr = "0.0.0.0/0"

# VPC configuration
vpc_cidr = "10.0.0.0/16"

# Database subnet configuration
create_database_subnet_group = true
create_database_subnet_route_table = true
create_database_internet_gateway_route_table = false
create_database_nat_gateway_route_table = false


# Bastion configuration
bastion_instance_type     = "t3.micro"
bastion_instance_key_pair = "class2026"