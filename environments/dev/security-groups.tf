module "security_group" {
  source   = "../../modules/security-group"
  ssh_cidr = var.ssh_cidr
}
