# output the ubuntu ami id
output "ubuntu_ami_id"  {
    description = "The latest Ubuntu AMI ID"
    value = data.aws_ami.ubuntu.id
}

# output the amazon linux 2 ami id
output "amzn_linux_2_ami_id" {
    description = "The latest Amazon Linux 2 AMI ID"
    value= data.aws_ami.amzn-linux-ami.id
}