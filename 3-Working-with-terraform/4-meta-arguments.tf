
##################
# Metea-Arguments
##################

# depends_on
##############
resource "local_file" "pet" {
  filename = var.filename
  content  = var.content
  depends_on = [
    random_pet.my-pet
  ]
}
resource "random_pet" "my-pet" {
  prefix    = var.prefix
  separator = var.separator
  length    = var.length
}


# lifecycle
##############
resource "local_file" "pet" {
  filename        = "/root/pets.txt"
  content         = "We love pets!"
  file_permission = "0700"
  lifecycle {
    create_before_destroy = true
  }
}


# count
# https://www.terraform.io/language/meta-arguments/count
########################################################
resource "local_file" "pet" {
  filename        = var.filename1[count.index]
  content         = "We love pets!"
  file_permission = "0700"

  count = length(var.filename1)
}

variable "filename1" {
  type = list(string)
  default = [
    "/root/pets.txt",
    "/root/dogs.txt",
    "/root/cats.txt"
  ]
}

# length function
##################
# variable                                  # function          # value
# ########                                  # ########          # ######
# fruits = [ "apple", "banana", "orange"]   # length(fruits)    # 3
# cars = [ “honda”, “bmw”, “nissan”, “kia”] # length(cars)      # 4
# colors = [ “red”, “purple”]               # length(colors)    # 2

########################################################################
########################################################################

# for_each (works ONLY with 'map' or 'set' variables types)
#############################################################
resource "local_file" "pet" {
  filename = each.value
  for_each = var.filename2
  # Or if the variabel is a list type
  # for_each = toset(var.filename2)

}

variable "filename2" {
  type = set(string)
  default = [
    "/root/pets.txt",
    "/root/dogs.txt",
    "/root/cats.txt"
  ]
}

##############









