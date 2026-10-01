# Security Group for  SSH and TLS traffic
resource "aws_security_group" "vpc-ssh" {
  name        = var.name
  description = "Allow TLS inbound traffic and all outbound traffic"


  tags = {
    Name = var.name
  }
}

# InBound Rules for Security Group - TLS traffic
resource "aws_vpc_security_group_ingress_rule" "vpc-tls_ipv4" {
  security_group_id = aws_security_group.vpc-ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}



# InBound Rules for Security Group - SSH traffic
resource "aws_vpc_security_group_ingress_rule" "vpc-ssh_ipv4" {
  security_group_id = aws_security_group.vpc-ssh.id
  cidr_ipv4         = var.ssh_cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# InBound Rules for Security Group - HTTP traffic
resource "aws_vpc_security_group_ingress_rule" "vpc-http_ipv4" {
  security_group_id = aws_security_group.vpc-ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}




# Allow all outbound traffic for the security group
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.vpc-ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}







