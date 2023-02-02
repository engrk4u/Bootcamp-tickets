# Define Local Values in Terraform
locals {
  environment = var.environment
  name        = local.environment
  subnet_id = {
    dev  = "subnet-07aaacf063232de12"
    prod = "subnet-076a1785c7ec531e4"
  }
  instance_type = {
    dev  = "t2.micro"
    prod = "t2.medium"
  }
}

#local.subnet_id${local.environment}
