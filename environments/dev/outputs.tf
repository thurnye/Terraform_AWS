# Terraform Outputs
output "instance_name" {
  description = "Name of the EC2 instance"
  value       = module.my_ec2_instance_1.instance_name
}

# EC2 instance state
output "instance_state" {
  description = "State of the EC2 instance"
  value       = module.my_ec2_instance_1.instance_state
}

# EC2 Instance Public IP Address
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.my_ec2_instance_1.instance_public_ip
}


# EC2 Instance Public DNS Name
output "instance_public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = module.my_ec2_instance_1.instance_public_dns
}
