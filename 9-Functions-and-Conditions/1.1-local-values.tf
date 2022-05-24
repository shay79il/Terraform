
# Use of locals spare us the nessesity to 
# reapet ourselves with the SAME code over and over 

############
# Example 1
############

# Instead of writing 
# 'tags =  {
#   Department = "finance"
#   Project = "cerberus"
# }'
# we put it in locals block 
# and use instead
# 'tags = local.common_tags'

resource "aws_instance" "web" {
  ami = "ami-06178cf087598769c"
  instance_type = "t2.medium"
  tags = local.common_tags
}

resource "aws_instance" "db" {
  ami = "ami-0567cf08759818b"
  instance_type = "m5.large"
  tags = local.common_tags
}

locals {
  common_tags =  {
    Department = "finance"
    Project = "cerberus"
  }
}

############
# Example 2
############
# lets say we need a variable declered by another variable
# Terraform does NOT support that so we can use of 'locals'
# AND also
# to create randomly string for every bucket we 
# create so we can use locals block to create a 'local' to create 
# random bucket name 

resource "aws_s3_bucket" "finance_bucket" {
  acl = "private"
  bucket = local.bucket-prefix
}

resource "random_string" "random-suffix" {
  length = 6
  special = false
  upper = false
}

variable "project" {
  default = "cerberus"
}

locals {
  # bucket = <project_name>-<random_string>-bucket
  bucket-prefix = "${var.project}-${random_string.random-suffix.id}-bucket"
}
