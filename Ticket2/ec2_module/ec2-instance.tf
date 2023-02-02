resource "aws_instance" "web" {
  ami           = data.aws_ami.ec2.id
  instance_type = local.instance_type[local.name]
  subnet_id     = local.subnet_id[local.name]
  #vpc_security_group_ids = aws_security_group.tcp_ssh.id
  key_name = aws_key_pair.deployer.key_name


  tags = {
    Name = "Helloworld${local.name}"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "ansible1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6/eF5dLgQcLfnFQGziaLl090FoUU/RuVW7Rp/FZegPBGBKVhMDfgbeoseLfksU/awoMghQ5okxsqhH4e1QhIPlqKReFemukg+9s8h3g/vIRWP81B1C/Pq2FrQ9pPD+A7cyTXDNBdETq2+xvgHDKC2AZcG7njNqjhBoWhkcFTDbX1lcwtWjBE5IR8iRo4x9pROfNcfKCOni1OExYX+dOwxTYTYSfIADVkqJKZ4aB4WmeTTq35lsmXQKiifpyez/3aVVea0VGtXFaDMDaHlie3Z8lCo6Nib/9lknpWbmFGzWjRYnzhvkWXSKM4c3id9AUdQRLdm04D4m5UTIeZSHBGx ansible"
}



/*
resource "aws_key_pair" "tf-key-pair" {
key_name = "tf-key-pair"
public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
algorithm = "RSA"
rsa_bits  = 4096
}
resource "local_file" "tf-key" {
content  = tls_private_key.rsa.private_key_pem
filename = "tf-key-pair"
}
*/