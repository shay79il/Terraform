
# Lets say we have 2 aws resources we want 
# to provision in 2 different regions
# we can create 'provider.tf' file with 2 provider blocks
# one of them with an alias

resource "aws_key_pair" "alpha" {
  key_name = "alpha"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3......alpha@a-server"
}


# if for example we want to provision the 'beta' resource 
# in "ca-central-1" region we can just add the argument 
# 'provider' with the relevent alias
resource "aws_key_pair" "beta" {
  key_name = "beta"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3.........beta@b-server"
  
  # provider = <provider_name>.<alias_name> ==> aws.central
  provider = aws.central
}

#############
# provider.tf
#############
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "ca-central-1"
  alias = "central"
}


