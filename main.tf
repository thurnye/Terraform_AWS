resource "aws_instance" "my_ec2_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.instance_key_pair
  user_data = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id]
  tags = {
    Name = "My_EC2_Instance_Demo"
  }
}