
# output the entire module output as a list of objects
output "instances" {
  description = "EC2 instance details"

  value = [
    for instance in aws_instance.my_ec2_instance : {
      name           = instance.tags["Name"]
      id             = instance.id
      public_dns     = instance.public_dns
      public_ip      = instance.public_ip
      instance_type  = instance.instance_type
      instance_state = instance.instance_state
      availability_zone = instance.availability_zone
    }
  ]
}
