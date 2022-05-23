#############################################################################
# Resource                                  ##     Data Source
# ########                                  ##     ########### 
# Keyword: resource                         ##     Keyword: data
# Creates, Updates, Destroys Infrastructure ##     Only Reads Infrastructure
# Also called Managed Resources             ##     Also called Data Resources
#############################################################################


# Data Source allows Terraform to READ 
# attributes provisioned OUTSIDE of Terraform
# See the 'data' Keyword
data "local_file" "pet" {
  filename = "/root/pets.txt"
  content  = "We love pets!"
}


# See the 'resource' Keyword
resource "local_file" "pet" {
  filename = "/root/pets.txt"
  content  = data.local_file.pet.content
}

# Another example
#################

data "aws_key_pair" "alpha" {
  
  # We can use only this 
  # in the DATA block to identify
  # the UNMANAGED terraform resource
  key_name = "alpha"
  
  
  #Or 
  # we can use the 'filter' attribute 
  filter {
    name = "tag:project"
    values = ["cerberus"]
  }

}
resource "aws_instance" "cerberus" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = data.aws_key_pair.alpha.key_name
}
