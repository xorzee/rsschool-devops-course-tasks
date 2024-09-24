variable "project_name" {
  description = "The project name"
  default     = "demo-rs-school-devops-edu"
  type        = string
}

variable "environment" {
  description = "The deployment environment"
  default     = "dev"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "You can only use `dev`, `staging` or `prod`"
  }
}

variable "aws_profile" {
  description = "AWS profile to use"
  type        = string
  default     = ""
}
