# variables
############
# description - description of the variable
# default - default value
# type - [optional] if specified it enforces the type
#       - string - in between ""
#       - number - positive or negative
#       - bool   - true / false
#       - any    - by default 
#       - list   - ["cat", "dog"] (each element is of the same type)
#       - set    - ["cat", "dog"] (no duplicate elements)
#       - map    - {pet1: cat, pet2: god}
#       - object - Complex data struct
#       - tuple  - list of different types
#        


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
    name = bella
    color = brown
    age = 7
    food = ["fish","chicken", "turkey"]
    favorit_pet = bool
  }
}

