variable "region" {
  description = "AWS region"
}

variable "key_name" {
  description = "Security key pair name."
  sensitive   = true
}

variable "vpc_id" {
  description = "AWS VPC to make instances available under."
}

variable "private_subnet_ids" {
  description = "AWS VPC Subnets available for private deployment."
}

variable "public_subnet_ids" {
  description = "AWS VPC Subnets available for public deployment."
}
