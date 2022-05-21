

#########
# Before
#########
resource "local_file" "pet" {
  filename = var.filename
  content = "My favorite pet is Mr.Cat"
}
resource "random_pet" "my-pet" {
  prefix = var.prefix
  separator = var.separator
  length = var.length
}


#########
# After
#########

# Implicit Dependency
###########################

resource "local_file" "pet" {
  filename = var.filename
  content = "My favorite pet is ${random_pet.my-pet.id}"
}


resource "random_pet" "my-pet" {
  prefix = var.prefix
  separator = var.separator
  length = var.length
}



# Explicit Dependency
# Used for indirect dependency 
################################
resource "local_file" "pet" {
  filename = var.filename
  content = "My favorite pet is Mr.Cat"
  depends_on = [
    random_pet.my-pet
  ]
}

resource "random_pet" "my-pet" {
  prefix = var.prefix
  separator = var.separator
  length = var.length
}