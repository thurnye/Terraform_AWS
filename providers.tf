# Terraform Configuration
terraform {
  # Required Terraform Version
  required_version = "~> 1.16"



  # Required Providers and their Versions
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0" # Optional but recommended
    }
  }

  # Remote Backend for storing Terraform State in S3 bucket 
  backend "s3" {
    bucket = "my-terraform-udemy-lab"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

# Provider Configuration
provider "aws" {
  region = "us-east-1"
  
}

