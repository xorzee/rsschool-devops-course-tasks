variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to be applied to all resources"
  default = {
    "edu:project" : "rs-school"
  }
}

variable "security_ec2_key_pair_name" {
  type        = string
  description = "Required. Key pair name from EC2 Security Key Pairs."
  sensitive = true
}
