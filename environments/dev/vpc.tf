# using a module from the terraform registry to create a VPC with public and private subnets, NAT gateway, and other resources https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/6.7.3

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.7.3"

  # Basic VPC configuration
  name = "vpc-dev"
  cidr = var.vpc_cidr

  # Only use the first 2 availability zones from the list of available AZs
  azs = slice([
    for az in data.aws_availability_zones.my_azs.names : az
    if length(data.aws_ec2_instance_type_offerings.my_instance_types[az].instance_types) != 0
  ], 0, 2)

  private_subnets  = [for i in range(2) : cidrsubnet(var.vpc_cidr, 8, i)] // create 2 private subnets in the VPC
  public_subnets   = [for i in range(2) : cidrsubnet(var.vpc_cidr, 8, i + 4)]

  # database subnet
  database_subnets = [for i in range(2) : cidrsubnet(var.vpc_cidr, 8, i + 8)]
  create_database_subnet_group = var.create_database_subnet_group
  create_database_subnet_route_table = var.create_database_subnet_route_table
  create_database_internet_gateway_route = var.create_database_internet_gateway_route_table
  create_database_nat_gateway_route = var.create_database_nat_gateway_route_table

  # Nat gateway for outbound internet access from private subnets
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC Dns parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Name        = "public-subnet"
  }
  private_subnet_tags = {
    Name = "private-subnets"
  }
  database_subnet_tags = {
    Name = "database-subnets"
  }
  tags ={
    Owner = "dev-team"
    Environment = "dev"
  }
  vpc_tags = {
    Name = "vpc-dev"
  }
}
