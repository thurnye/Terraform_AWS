# using an amazon owned module 

# EC2 Public Bastion 
module "public_bastion_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.4.1"

  name       = "my_Bastion_Instance"
  ami        = data.aws_ami.amzn-linux-ami.id
  instance_type = var.bastion_instance_type
  key_name      = var.bastion_instance_key_pair
  # monitoring    = true
  subnet_id     = module.my-vpc-network.public_subnet_ids[0]
  vpc_security_group_ids = [module.public_bastion_security_group.id]

  tags = local.common_tags
}

# Create the Bastion Elastic IP
# resource - depends_on Meta-Argument
resource "aws_eip" "bastion_eip" {
  depends_on = [ module.public_bastion_ec2_instance, module.my-vpc-network ] #only when the bastion and the vpc is created, thats when this module gets created
  instance = module.public_bastion_ec2_instance.id
  domain   = "vpc"
  tags = local.common_tags
}

