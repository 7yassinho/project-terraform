provider "aws" {
  region = var.aws_region
}

# Questo blocco assicura che Terraform scarichi i provider necessari.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}