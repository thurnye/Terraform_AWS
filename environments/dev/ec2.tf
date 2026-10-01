module "demo_instance" {
  source             = "../../modules/ec2"
  instance_type      = var.instance_type
  instance_key_pair  = var.instance_key_pair
  security_group_ids = [module.security_group.id]

  # Package installation needs the outbound rule to exist at launch.
  depends_on = [module.security_group]
  name       = "Count-My_EC2_Instance_${count.index + 1}"
  count      = var.instance_count
  
}

