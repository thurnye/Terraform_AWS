resource "aws_instance" "name" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  user_data = file("${path.module}/app1-install.sh")
  tags = {
    Name = "My_EC2_Instance_Demo"
  }
}