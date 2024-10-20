# 🕸️ network

This Terraform configuration sets up a VPC in AWS with public and private subnets and NAT for outbound internet access from private subnets.

## Components

- VPC with 2 public and 2 private subnets across different Availability Zones
- Internet Gateway for public internet access
- NAT Gateway (or NAT Instance) for outbound internet access from private subnets
- Security groups for NAT, NACL for VPC

## Files

- `vpc.tf`: Main VPC and subnet configuration
- `routing.tf`: Routing table configuration
- `security_groups.tf`: Security group definitions
- `nat.tf`: NAT Gateway (or Instance) configuration
- `nacl.tf`: Extremely permissive NACL bound to VPC and its subnets
