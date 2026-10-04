module "security_group" {
  source   = "../../modules/security-group"
  ssh_cidr = var.ssh_cidr
}


# from AWS security group module
module "public_bastion_security_group" {
  source = "terraform-aws-modules/security-group/aws"
  version = "6.0.0"
  name        = "${local.name}_public_bastion_sg"
  description = "Public security group for bastion host SSH access, egress ports are all world open"
  vpc_id      = module.my-vpc-network.vpc_id

# ingress rules for the bastion host security group
  ingress_rules = {
    
    http = {
      from_port   = 80
      ip_protocol = "tcp"
      cidr_ipv4   = var.ssh_cidr
      description = "Allow HTTP traffic from anywhere"
    }
    https = {
      from_port   = 443
      ip_protocol = "tcp"
      cidr_ipv4   = var.ssh_cidr
      description = "Allow HTTPS traffic from anywhere"
    }
    ssh = {
      from_port   = 22
      ip_protocol = "tcp"
      cidr_ipv4   = var.ssh_cidr
      description = "Allow SSH traffic from specified CIDR"
    }
    self-all = {
      ip_protocol                  = "-1"
      referenced_security_group_id = "self"
      description                  = "All traffic from members of this SG"
    }
  }

# egress rules for the bastion host security group
  egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

# tags for the bastion host security group
  tags = local.common_tags
  
}
