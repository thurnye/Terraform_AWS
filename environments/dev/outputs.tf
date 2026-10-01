# Terraform Outputs
locals {
  instances = flatten([
    for ec2 in module.demo_instance : ec2.instances
  ])
}

output "instance_name" {
  description = "Name of the EC2 instance"
  value       = local.instances[*].name
}

# EC2 instance state
output "instance_state" {
  description = "State of the EC2 instance"
  value       = local.instances[*].instance_state
}

# EC2 Instance Public IP Address
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = local.instances[*].public_ip
}


# EC2 Instance Public DNS Name
output "instance_public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = local.instances[*].public_dns
}


# Output for the loop with  list
output "for_output_list" {
  description = "Output for the loop with list"
  value       = [for instance in local.instances : instance.public_dns]
}


# output for loop with map
output "for_output_map" {
  description = "Output for the loop with map"
  value       = { for instance in local.instances : instance.id => instance.public_dns }
}

# output for loop with map advanced
output "for_output_map_advanced" {
  description = "Output for the loop with map advanced"
  value       = { for c, instance in local.instances : c => instance.public_dns if instance.instance_state == "running" }
}


# output legacy splat operator (legacy)  - returns the list
# output "legacy_splat_operator" {
#   description = "Output legacy splat operator (legacy)  - returns the list"
#   value       = local.instances.*.public_dns
# }


# output latest generalized splat operator - return the list
# output "latest_generalized_splat_operator" {
#   description = "Output latest generalized splat operator - return the list"
#   value       = local.instances[*].public_dns
# }
