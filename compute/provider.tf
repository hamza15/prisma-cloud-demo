terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.66.0"
    }
  }
  backend "s3" {
    bucket  = "prisma-tf-backend"
    key  = "terraform/state-compute/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "tf-backend"
  }
}

provider "aws" {
  region  = "us-east-1"
}