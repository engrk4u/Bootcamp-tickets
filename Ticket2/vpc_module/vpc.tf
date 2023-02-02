resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/24"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"

  tags = {
    Name = "bootcamp"
  }
}

resource "aws_subnet" "dev_public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.64/26"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = "eu-west-2a"

  tags = {
    Name = "dev-subnet-public"
  }
}

resource "aws_subnet" "prod_private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/26"
  availability_zone = "eu-west-2c"

  tags = {
    Name = "prod-subnet-private"
  }
}

output "vpc_name" {
  value = aws_vpc.main.id
}

output "private_subnet_id" {
  value = aws_subnet.prod_private.id
}

output "public_subnet_id" {
  value = aws_subnet.dev_public.id
}