
# Use of a sub module of security group for ssh
################################################
module "security-group_ssh" {
  source  = "terraform-aws-modules/security-group/aws/modules/ssh"
  version = "3.16.0"

  # insert the 2 required variables here
  name                = "ssh-access"
  vpc_id              = "vpc-7d8d215"
  ingress_cidr_blocks = ["10.10.0.0/16"]
}


# terraform get [version]
###############
# Get the relevant module which we want use and
# which was specified in the 'module' block 
# of our configuration
# In order to get a spesific version 
# look at
# https://github.com/terraform-aws-modules/terraform-aws-security-group/tree/master/modules/ssh
# on the the 'Tags' history
