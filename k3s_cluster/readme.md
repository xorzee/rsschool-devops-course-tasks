# 📦 k3s_cluster

This Terraform configuration sets up a VPC in AWS with public and private subnets and NAT for outbound internet access from private subnets.

## Components

- Security groups for K3S nodes
- K3S agents with cloudinit configuration
- K3S server with cloudinit configuration
- SSM parameter for K3S cluster token 
- AMI discovery
- IAM instance profile for SSM parameter

## Files

- `ami.tf` - AMI discovery looking up Amazon Linux 2 x86_64 instances
- `cloud-init.server.yaml` – Cloud init template for server
- `cloud-init.worker.yaml` – Cloud init template for worker
- `cloud-init.tf` – Cloud init readers aggregated
- `iam.tf` – SSM parameter store allowance
- `k3s-agents.tf` – EC2 instance configuration for K3S agent nodes
- `k3s-server.tf` – EC2 instance configuration for K3S worker nodes
- `security_groups.tf` – SG for any K3S nodes
- `ssm.tf` – `aws_ssm_parameter` configuration and parameter creation
- `variables.tf` – variables applicable for this stack
