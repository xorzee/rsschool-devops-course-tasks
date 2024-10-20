variable "security_ec2_key_pair_name" {
  type        = string
  description = "Required. Key pair name from EC2 Security Key Pairs."
  sensitive   = true
}
