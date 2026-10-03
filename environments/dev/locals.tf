locals {
    owner = "DevOps"
    environment = "dev"
    name = "${local.owner}-env-${local.environment}"
    common_tags = {
        owners = local.owner
        environment = local.environment
    }
}