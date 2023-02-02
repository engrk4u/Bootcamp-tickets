data "aws_ami" "ec2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "terraform_remote_state" "ec2" {
  backend = "s3"
  config  = {
    bucket = "bootcamp29-360-abdul"
    key    = "terraform.tfstate/dev"
    region = "eu-west-2"
  }
}