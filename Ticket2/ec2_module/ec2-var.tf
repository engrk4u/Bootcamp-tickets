variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "public_instance_count" {
  description = "AWS EC2 Public Instances Count"
  type        = number
  #default     = 1
}

variable "instance_key_pair" {
  type = string
  #default     = "ansible"
}

# Environment Variable
variable "environment" {
  type    = string
  #default = ["dev", "prod"]
  #default = "prod"
}

/*
variable "instance_type" {
  type    = list
  default = ["t2.micro", "t2.medium"]
}

variable "private_subnet" {
  type    = string
  default = "subnet-06c1ffb9cdf579cef"
}

variable "public_subnet" {
  type    = string
  default = "subnet-06626b21fde2746fa"
}
*/
