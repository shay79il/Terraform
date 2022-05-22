
# Functions we have used so far already
#######################################

# The 'file()' function
resource "aws_iam_policy" "adminUser" {
  name = "AdminUsers"
  policy = file("admin-policy.json")
}

# The 'length()' function
resource "local_file" "pet" {
  filename = var.filename
  count = length(var.filename)
}

# The 'toset()' function
resource "local_file" "pet" {
  filename = var.filename
  for_each = toset(var.region)
}

variable region {
  type = list
  default = [
    "us-east-1",
    "us-east-1",
    "ca-central-1"
  ]
  description = "A list of AWS Regions"
}


###############################################
###############################################

# The USE use of 'terraform console'
# A tool to experiment the build IN terraform functions

###################
# Numeric Functions
###################

# E.g.
#! > file("/root/terraform-projects/main.tf)
# Console output:
# resource "aws_instance" "development" {  
#   ami           = "ami-0edab43b6fa892279"
#   instance_type = "t2.micro"
# }

#! > length(var.region)
# Console output:
# 3

#! > toset(var.region)
# Console output:
# [
# "ca-central-1",
# "us-east-1",
# ]

#! > max (-1, 2, -10, 200, -250)
# Console output:
# 200

#! > min (-1, 2, -10, 200, -250)
# Console output:
# -250


##################################
# When using referncing a variable
# with a list we can use the '...' 
# as shown as follow:
variable "num" {
  type = set(number)
  default = [ 250, 10, 11, 5]
  description = "A set of numbers"
}

#! > max(var.num...)
# Console output:
# 250
##################################


#! > ceil(10.1)
# Console output:
# 11

#! > ceil(10.9)
# Console output:
# 11

#! > floor(10.1)
# Console output:
# 10

#! > floor(10.9)
# Console output:
# 10

###############################################
###############################################

###################
# String Functions
###################

# Use of split function ("delimiter", "string to be splitted")
#! split(",", "ami-xyz,AMI-ABC,ami-efg")
# Console output:
# [ "ami-xyz","AMI-ABC","ami-efg" ]

# When using a varible:
variable "ami" {
  type = string
  default = "ami-xyz,AMI-ABC,ami-efg"
  description = "A string containing ami ids"
}
#! > split(",", var.ami)
# Console output:
# [ "ami-xyz","AMI-ABC","ami-efg“ ]

#! > lower(var.ami)
# Console output:
# ami-xyz,ami-abc,ami-efg

#! > upper(var.ami)
# Console output:
# AMI-XYZ,AMI-ABC,AMI-EFG

#! > title(var.ami)
# Console output:
# Ami-Xyz,AMI-ABC,Ami-Efg

# usage: substr(var, offset, length)
#! > substr(var.ami, 0, 7)
# Console output:
# ami-xyz

#! > substr(var.ami, 8, 7)
# Console output:
# AMI-ABC

#! > substr(var.ami, 16, 7)
# Console output:
# ami-efg

#! > join(",", ["ami-xyz", "AMI-ABC", "ami-efg"])
# Console output:
# ami-xyz,AMI-ABC,ami-efg

# When using a varible:
variable "ami" {
  type = list
  default = ["ami-xyz", "AMI-ABC", "ami-efg"]
  description = "A list of numbers"
}

#! > join(",", var.ami)
# Console output:
# ami-xyz,AMI-ABC,ami-efg

###############################################
###############################################


######################
# Collection Functions
######################

# When using a varible:
variable "ami" {
  type = list
  default = ["ami-xyz", "AMI-ABC", "ami-efg"]
  description = "A list of numbers"
}

#! > length(var.ami)
# Console output:
# 3

#! > index(var.ami, "AMI-ABC")
# Console output:
# 1

#! > element(var.ami,2)
# Console output:
# ami-efg

#! > contains(var.ami, "AMI-ABC")
# Console output:
# true

#! > contains(var.ami, "AMI-XYZ")
# Console output:
# false

##############################################
##############################################

#################
# Map Functions
#################


# When using a varible:
variable "ami" {
  type = map
  default = { 
    "us-east-1" = "ami-xyz",
    "ca-central-1" = "ami-efg",
    "ap-south-1" = "ami-ABC"
  }
  description = "A map of AMI ID's for specific regions"
}


#! > keys(var.ami)
# Console output:
# [
# "ap-south-1",
# "ca-central-1",
# "us-east-1",
# ]

#! > values(var.ami)
# Console output:
# [
# "ami-ABC",
# "ami-efg",
# "ami-xyz",
# ]

#! > lookup(var.ami, "ca-central-1")
# Console output:
# ami-efg

#! > lookup(var.ami, "us-west-2")
# Console output:
# Error: Error in function call
# on <console-input> line 1:
# (source code not available)
# |----------------
# | var.ami is map of string with 3 elements
# Call to function "lookup" failed: lookup failed 
# to find 'us-west-2’.

# Usage: (var, key, default) 
# key      = key to search in the map inside var
# default  = result if key not dound)
#! > lookup (var.ami, "us-west-2", "ami-pqr")
# Console output:
# ami-pqr