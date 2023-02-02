terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "bootcamp29-360-abdul"
    key    = data.terraform_remote_state.ec2
    #dynamodb_table = "terradynatable2"
    region = "eu-west-2"
    #encrypt = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

