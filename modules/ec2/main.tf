resource "aws_instance" "my_ec2_instance" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  # instance_type          = var.instance_type_list[0]
  # instance_type          = var.instance_type_map["dev"]

  key_name               = var.instance_key_pair
  user_data              = file("${path.module}/scripts/app-install.sh")
  vpc_security_group_ids = var.security_group_ids
  count                  = var.instance_count
  availability_zone       = var.availability_zone
  tags = {
    Name = var.name
  }
}
