module "github_actions_iam" {
  source = "./gh_action_role"
}

module "network" {
  source = "./network"
}

module "instances" {
  source = "./instances"

  public_subnet_ids = module.network.public_subnet_ids
  vpc_id            = module.network.vpc_id
  key_name          = var.security_ec2_key_pair_name
}
