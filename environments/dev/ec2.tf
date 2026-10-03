module "demo_instance" {
  instance_ami       = data.aws_ami.ubuntu.id
  source             = "../../modules/ec2"
  instance_type      = var.instance_type
  instance_key_pair  = var.instance_key_pair
  security_group_ids = [module.security_group.id]

  # Package installation needs the outbound rule to exist at launch.
  depends_on = [module.security_group]
  name       = "Count-My_EC2_Instance_${each.key}"
  # count      = var.instance_count
  # for_each   = toset(data.aws_availability_zones.my_azs.names)
  # availability_zone = each.key
  availability_zone = each.key
  # for_each = toset(keys({
  #   for az, details in data.aws_ec2_instance_type_offerings.my_instance_types : az => details.instance_types if length(details.instance_types) != 0
  # }))
  for_each = toset(slice([
  for az in data.aws_availability_zones.my_azs.names : az
  if length(data.aws_ec2_instance_type_offerings.my_instance_types[az].instance_types) != 0
], 0, 2))
}

