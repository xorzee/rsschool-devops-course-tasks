variable "key_name" {
  description = "Security key pair name."
  sensitive   = true
}

variable "vpc_id" {
  description = "AWS VPC to make instances available under."
}

variable "public_subnet_ids" {
  description = "AWS VPC Subnets available for public deployment."
}
