terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.41.0"
    }
  }

  backend "s3" {
    bucket  = "course-project-terraform-states-oppressive"
    encrypt = true
    key     = "terraform/eks/terraform.tfstate"
    region  = "us-east-1"
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      owner = "oppressive"
    }
  }
}

variable "region" {
  description = "aws region"
  default     = "us-east-1"
}
