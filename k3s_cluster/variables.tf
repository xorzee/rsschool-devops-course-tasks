variable "key_name" {
  type        = string
  description = "Security key pair name."
  sensitive   = true
}

variable "vpc_id" {
  type        = string
  description = "AWS VPC to make instances available under."
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "AWS VPC Subnets available for private deployment."
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "AWS VPC Subnets available for public deployment."
}

variable "bastion_security_group_id" {
  type        = string
  description = "Bastion security group ID"
}

variable "master_node_instance_type" {
  type        = string
  description = "Master node instance type"
  default     = "t3a.small"
}

variable "master_node_instance_count" {
  type        = number
  default     = 1
  description = "Master nodes allocation"
  validation {
    error_message = "Cannot be more than 1 with the current design"
    condition     = var.master_node_instance_count == 1
  }
}

variable "worker_node_instance_type" {
  type        = string
  default     = "t3a.small"
  description = "Worker node instance type"
}

variable "worker_node_instance_count" {
  type        = number
  default     = 2
  description = "Worker nodes allocation"
}
