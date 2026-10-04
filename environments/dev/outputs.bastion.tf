# Public EC2 instances - Bastion Host
# EC2 bastion public instance id
output "bastion_instance_id" {
  description = "List of bastion instance id"
  value = module.public_bastion_ec2_instance.id
}

# EC2 bastion public ip
output "bastion_public_ip" {
  description = "List of bastion instance id"
  value = module.public_bastion_ec2_instance.public_ip
}
