terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

   backend "s3" {
    bucket = "bootcamp29-360-abdul"
    key = "terraform.tfstate/s3"
    #dynamodb_table = "terraform-lock"

    region = "eu-west-2"
 }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "bc" {
  #bucket = "bootcamp29-${random-number}-{yourname}"
  bucket = "bootcamp29-360-abdul"

  tags = {
    Name        = "My-terraform-bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.bc.id
  acl    = "private"
}

resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "ssl" {
  bucket = aws_s3_bucket.bc.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.bc.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "my-terraform-state" {
  bucket = "my-terraform-state"
  acl = "private"
}

/*
resource "aws_dynamodb_table" "my-terraform-lock" {
  name           = "my-terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}*/

output "S3_BUCKET_NAME" {
  value = aws_s3_bucket.bc.id
}

output "kms_id" {
  value = aws_kms_key.mykey.key_id
}

output "kms_arn" {
  value = aws_kms_key.mykey.arn
}

output "sse" {
  value = aws_s3_bucket_server_side_encryption_configuration.ssl.id
}