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