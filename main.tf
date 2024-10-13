module "github_actions_iam" {
  source = "./gh_action_role"
}

module "network" {
  source = "./network"

  region      = var.aws_region
  common_tags = var.common_tags
}

module "instances" {
  source = "./instances"

  region             = var.aws_region
  private_subnet_ids = module.network.private_subnet_ids
  public_subnet_ids  = module.network.public_subnet_ids
  vpc_id             = module.network.vpc_id
  key_name           = var.security_ec2_key_pair_name
  common_tags        = var.common_tags
}
