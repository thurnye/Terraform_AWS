# create a null resource and provisioners
resource "null_resource" "copy_ec2_keys" {
  depends_on = [module.public_bastion_ec2_instance]
  # connection block for provisioners to connect to ec2 instance
  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("keys/class2026.pem")
  }
  #File provisioner : copies the terraform-key.pem file to /tmp/class2026.pem
  provisioner "file" {
    source = "keys/class2026.pem"
    destination = "/tmp/class2026.pem"
  }

# Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
provisioner "remote-exec" {
  inline = [ 
    "sudo chmod 400 /tmp/class2026.pem"
   ]
}
# Local Exec Provisioner: local-exec provisioner. (Creation-Time Provisioner - Triggered during Create Resource)
provisioner "local-exec" {
  command = "echo VPC ceated on `date` and VPC ID: ${module.my-vpc-network.vpc_id} >> creation-time-vpc-id.txt"
  working_dir = "local-exec-output"
}
}

