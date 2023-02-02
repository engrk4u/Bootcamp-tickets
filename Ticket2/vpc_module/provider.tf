terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "bootcamp29-360-abdul"
    key    = "terraform.tfstate/vpc"
    #dynamodb_table = "terraform-lock"
    #encrypt = true
    region = "eu-west-2"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
}