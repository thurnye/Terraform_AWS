# Add VPC resources here when needed.
# using a module from the terraform registry to create a VPC with public and private subnets, NAT gateway, and other resources https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/6.7.3

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.7.3"

  # Basic VPC configuration
  name = var.name
  cidr = var.vpc_cidr

  # Only use the first 2 availability zones from the list of available AZs
  azs = var.vpc_azs

  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets

  # database subnet
  database_subnets = var.database_subnets
  create_database_subnet_group = var.create_database_subnet_group
  create_database_subnet_route_table = var.create_database_subnet_route_table
  create_database_internet_gateway_route = var.create_database_internet_gateway_route_table
  create_database_nat_gateway_route = var.create_database_nat_gateway_route_table

  # Nat gateway for outbound internet access from private subnets
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  # VPC Dns parameters
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  public_subnet_tags = var.public_subnet_tags
  private_subnet_tags = var.private_subnet_tags
  database_subnet_tags = var.database_subnet_tags
  tags = var.tags
  vpc_tags = var.vpc_tags
}
