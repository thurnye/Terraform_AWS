aws_region        = "us-east-1"
instance_type     = "t3.micro"
instance_key_pair = "class2026"
# Preserves the existing rule; use your public IP/32 to restrict SSH.
ssh_cidr = "0.0.0.0/0"
