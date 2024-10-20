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

module "k3s_cluster" {
  source                    = "./k3s_cluster"
  bastion_security_group_id = module.instances.bastion_security_group_id
  key_name                  = var.security_ec2_key_pair_name
  private_subnet_ids        = module.network.private_subnet_ids
  public_subnet_ids         = module.network.public_subnet_ids
  vpc_id                    = module.network.vpc_id
}
