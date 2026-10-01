resource "aws_instance" "my_ec2_instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.instance_key_pair
  user_data              = file("${path.module}/scripts/app-install.sh")
  vpc_security_group_ids = var.security_group_ids
  tags = {
    Name = var.name
  }
}
