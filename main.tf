terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = var.aws_profile != "" ? var.aws_profile : null
}

module "s3_state_bucket" {
  source = "./resources"

  project_name = var.project_name
  environment  = var.environment
}
