# variables arguments
######################
# description   - description of the variable
# sensitive     - Limits Terraform UI output when the variable is used in configuration
# validation    - validation rules for a particular variable
# default       - default value
# type          - [optional] if specified it enforces the type
#                   - string - in between ""
#                   - number - positive or negative
#                   - bool   - true / false
#                   - any    - by default 
#                   - list   - ["cat", "dog"] (each element is of the same type)
#                   - set    - ["cat", "dog"] (no duplicate elements)
#                   - map    - {pet1: cat, pet2: god}
#                   - object - Complex data struct
#                   - tuple  - list of different types
#        

# validation example 
# for the aws ami varible
variable "ami" {
type = string
description = "The id of the machine image (AMI) to use for the server."
  validation {
    condition = substr(var.ami, 0, 4) == "ami-"
    error_message = "The AMI should start with \"ami-\"."
  }
}



# string examples
##################
variable "filename" {
  default = "/home/shay79il/Documents/Private/Studies/devopsExperts/CertificationStudy/Terraform/2-Basics/pets.txt"
  type    = string # 
}

variable "separator" {
  default = "."
  type    = string # 
}

################################################


# list examples
################
variable "prefix" {
  default = ["Mr", "Mrs", "Sir"]
  type = list(string)
}

variable "length" {
  default = [1, 2, 3]
  type = list(number)
}

# Usage of a list variable
resource "random_pet" "cat" {
  prefix = var.prefix[0]  
  separator = "."
}
################################################

# map examples
##############
variable "file-content" {
  type    = map(string)
  default = { 
    "statment1" = "We love pets!"
    "statment2" = "We love animals!"
  }
}

variable "pet-count" {
  type    = map(number)
  default = { 
    "dogs"      = 3
    "cats"      = 1
    "goldfish"  = 2
  }
}

variable instance_type {
  type = map
  default = {
    "production" = "m5.large"
    "development"  = "t2.micro"
  }
}

# Usage of a list variable
############################
resource "aws_instance" "prodcution" {
  ami = var.ami
  instance_type = var.instance_type["development"]
  tags = {
    name = var.servers[0]
  }
}


################################################

# set examples
################
variable "age" {
  default = [10 ,12, 15]
  type = set(number)
}

variable "fruite" {
  default = ["apple", "banana"]
  type = set(string)
}
################################################

# tuple examples 
################
variable "kitty" {
  type = tuple([string, number, bool])
  default = ["cat", 7, true]
}

################################################
# objects examples
###################

variable "bella" {
  type = object({
    name = string
    color = string
    age = number
    food = list(string)
    favorit_pet = bool
  })
  default = {
    name = "bella"
    color = "brown"
    age = 7
    food = ["fish","chicken", "turkey"]
    favorit_pet = true
  }
}

