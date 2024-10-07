terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "dev-demo-rs-school-devops-edu-tfstate-49a9fff4"
    key     = "_main.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}